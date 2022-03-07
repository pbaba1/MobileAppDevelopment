import 'package:chitchatapp/get_current_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart' as FBA;
import 'package:flutter/material.dart';
import 'package:chitchatapp/constants.dart' as c;
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mime_type/mime_type.dart';
import 'package:recase/recase.dart';
import '../Login-SignIn/login.dart';
import 'package:path/path.dart' as Path;

class UserProfile extends StatefulWidget {
  final String? userImageURL;
  final String? displayName;
  final String? email;
  final String userID;
  const UserProfile(
      {Key? key,
      required this.userImageURL,
      required this.displayName,
      required this.email,
      required this.userID})
      : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String currentUserName = '';
  String currentUserID = '';
  String currentUserProfileImage = '';
  int _rating = 0;
  List<dynamic> _ratings = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUserProfileImage = widget.userImageURL!;
    setState(() {
      if (widget.displayName != null) {
        currentUserName =
            FBA.FirebaseAuth.instance.currentUser!.displayName.toString();
        currentUserID = FBA.FirebaseAuth.instance.currentUser!.uid.toString();
        // _fetchUserChats();
      }
    });
    _fetchUserDetails();
    _fetchUserRatings();
  }

  _fetchUserDetails() {
    print('CAME HERE!!');
    FBA.FirebaseAuth _firebaseAuth = FBA.FirebaseAuth.instance;
    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    FBA.User? user;
    _firebaseAuth.authStateChanges().listen((FBA.User? u) {
      user = u as FBA.User;
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
            (Route route) => false);
      } else {
        _firebaseFirestore
            .collection('users')
            .doc(user?.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  setState(() {
                    currentUserName = snapshot['display_name'];
                    currentUserID = snapshot.id;
                    if (currentUserID == widget.userID) {
                      currentUserProfileImage = snapshot['image_url'];
                      print('SEEE SEEEEEEE NOOOOOOOOOOOO');
                      print(snapshot.data() as Map<String, dynamic>);
                      if ((snapshot.data() as Map<String, dynamic>)
                          .containsKey("rating")) {
                        _ratings = snapshot['rating'];
                        print('SEEE SEEEEEEE');
                        print(_ratings);
                        if (_ratings.isNotEmpty) {
                          print('Ratings not empty!');
                          _calculateRating();
                        } else {
                          _rating = 0;
                        }
                      }
                    }
                  })
                });
      }
    });
  }

  //**********************************************************IMAGE PICKER********************************************************************* */
  imagePicker() {
    return ImagePickerWeb.getImageInfo.then((MediaInfo mediaInfo) {
      uploadFile(mediaInfo, 'images', mediaInfo.fileName.toString());
    });
  }

  //Getting Downloaded URI directly
  uploadFile(MediaInfo mediaInfo, String ref, String fileName) {
    try {
      String mimeType =
          mime(Path.basename(mediaInfo.fileName.toString())).toString();
      var metaData = UploadMetadata(contentType: mimeType);
      StorageReference storageReference = storage().ref(ref).child(fileName);

      UploadTask uploadTask = storageReference.put(mediaInfo.data, metaData);
      var imageUri;
      uploadTask.future.then((snapshot) => {
            Future.delayed(const Duration(seconds: 1)).then((value) => {
                  snapshot.ref.getDownloadURL().then((dynamic uri) {
                    imageUri = uri;
                    print('Download URL: ${imageUri.toString()}');
                    updateProfileLinkInDB(uri.toString());
                  })
                })
          });
    } catch (e) {
      print('File Upload Error: $e');
    }
  }

  updateProfileLinkInDB(String url) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserID)
        .update({'image_url': url});

    setState(() {
      currentUserProfileImage = url.toString();
    });
  }

//**********************************************************end of IMAGE PICKER********************************************************************* */

/******************************************RATING RELATED CODE*************************************************** */
  _calculateRating() {
    setState(() {
      _rating =
          _ratings.fold(0, (previous, current) => (previous + current) as int);
      _rating = (_rating / _ratings.length) as int;
    });
  }

  _fetchUserRatings() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userID)
        .get()
        .then((DocumentSnapshot snapshot) => {
              setState(() {
                if ((snapshot.data() as Map<String, dynamic>)
                    .containsKey("rating")) {
                  _ratings = snapshot['rating'];
                  if (_ratings.isNotEmpty) {
                    _calculateRating();
                  } else {
                    _rating = 0;
                  }
                }
              })
            });
  }

  _updateRating(double ratingValue) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userID)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
        Map<String, dynamic> data =
            documentSnapshot.data()! as Map<String, dynamic>;

        // now we need to update this message
        // we need to create one map
        print('#################');
        print(data['rating']);
        List<dynamic> obj = [];
        if (data['rating'] != null) {
          List<dynamic> obj = data['rating'];
        }
        obj.add(ratingValue);

        await FirebaseFirestore.instance
            .collection("users")
            .doc(widget.userID)
            .update({'rating': obj}).then(
                (value) => print("rating added successfully."));
        _fetchUserRatings();
      } else {
        print("nothing exists");

        // create new document
        // set foloowing data
        List<dynamic> obj = [];
        obj.add(ratingValue);

        FirebaseFirestore.instance.collection('users').doc(widget.userID).set(
            {'rating': obj}).then((value) {
          print("new rating added");
          _fetchUserRatings();
        }).catchError(
            (onError) => print("error occurred while creating new document"));
      }
    });
  }
  /****************************************** end of RATING RELATED CODE*************************************************** */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // user profile photo
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                        backgroundImage: widget.userImageURL == null
                            ? const AssetImage('assets/dummy_user.jpg')
                                as ImageProvider
                            : NetworkImage(currentUserProfileImage),
                        radius: 100),
                    widget.userID == currentUserID
                        ? Positioned(
                            bottom: 0,
                            right: 25,
                            child: IconButton(
                                onPressed: () {
                                  // _showPicker(context);
                                  imagePicker();
                                },
                                tooltip: 'Edit profile picture',
                                icon: const Icon(
                                  Icons.camera_enhance,
                                  color: Colors.indigo,
                                  size: 30,
                                )),
                          )
                        : const SizedBox()
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            // User Name
            Text(ReCase(widget.displayName.toString()).titleCase,
                style: const TextStyle(
                  fontSize: 24,
                )),
            const SizedBox(height: 5),
            // Email
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.email.toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.indigo)),
                IconButton(
                  iconSize: 18,
                  color: Colors.grey,
                  icon: const Icon(Icons.copy_outlined),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: widget.email))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(c.EMAIL_COPIED)));
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 10),
            currentUserID != widget.userID
                ? Column(
                    children: [
                      RatingBar(
                          itemSize: 25,
                          initialRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                              full:
                                  const Icon(Icons.star, color: Colors.orange),
                              half: const Icon(
                                Icons.star_half,
                                color: Colors.orange,
                              ),
                              empty: const Icon(
                                Icons.star_outline,
                                color: Colors.orange,
                              )),
                          onRatingUpdate: (ratingValue) {
                            _updateRating(ratingValue);
                          }),
                      _rating > 0
                          ? Text(
                              'User\'s rating: ' + _rating.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontStyle: FontStyle.italic),
                            )
                          : const Text('This user has not been rated yet.',
                              style: TextStyle(
                                  fontSize: 16, fontStyle: FontStyle.italic))
                    ],
                  )
                : _rating > 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Your rating is: ',
                            style: TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                          for (var i = 0; i < _rating.toInt(); i++)
                            const Icon(Icons.star, color: Colors.indigo)
                        ],
                      )
                    : const Text('You have not been rated yet.',
                        style: TextStyle(
                            fontSize: 18, fontStyle: FontStyle.italic)),
            const SizedBox(height: 5),
            currentUserID == widget.userID
                ? const GetCurrentLocation()
                : Container()
          ],
        ),
      ),
    ));
  }
}
