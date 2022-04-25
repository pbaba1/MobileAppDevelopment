import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veershaivlingayat/Login/login.dart';
import 'package:veershaivlingayat/Profile/profile-images.dart';
import 'dart:io';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<dynamic> photos = [];
  List<dynamic> _imagesURL = [];
  String? userID = '';
  String _imageUrl = '';
  String _name = "Pooja Basavraj Baba";
  bool _isImageUploadError = false;
  String _downloadUrl = '';
  File _imageFile = new File('');
  final TextEditingController _displayname = TextEditingController();
  final TextEditingController _messages = TextEditingController();
  User? user;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  void _fetchUserDetails() {
    auth.authStateChanges().listen((User? u) {
      user = u;
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
            (Route route) => false);
      } else {
        firestore
            .collection('users')
            .doc(user?.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  setState(() {
                    userID = snapshot['uid'];
                    photos = snapshot['photos'];
                    _imagesURL = photos;
                    print('%%%%%%%%%%%%%%%');
                    print(_imagesURL);
                    print(photos);
                  })
                });
      }
    });
  }

  _update() async {
    await firestore
        .collection("users")
        .doc(auth.currentUser?.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      firestore
          .collection("users")
          .doc(snapshot['uid'])
          .update({'photos': _imagesURL});
      _fetchUserDetails();
    });
  }

  Future _uploadToFirebase(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Uploading the picture....")));
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref =
        storage.ref().child(userID! + '/' + DateTime.now().toString());
    try {
      UploadTask uploadTask = ref.putFile(_imageFile);
      uploadTask.then((res) {
        res.ref.getDownloadURL();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Picture uploaded!")));
      });

      _downloadUrl = await (await uploadTask).ref.getDownloadURL();
      setState(() {
        if (_imagesURL.length == 6) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "You can upload only 6 images. Please view gallery in case you want to update the images.")));
        } else {
          _imagesURL.add(_downloadUrl);
        }
        _update();
      });
      setState(() {
        _isImageUploadError = false;
      });
    } catch (e) {
      setState(() {
        _isImageUploadError = true;
      });
    }
  }

  _imgFromCamera(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });

    Navigator.of(context).pop();
    _uploadToFirebase(context);
  }

  _imgFromGallery(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });

    Navigator.of(context).pop();
    _uploadToFirebase(context);
  }

  void _picker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Gallery'),
                    onTap: () {
                      _imgFromGallery(context);
                    }),
                Builder(builder: (context) {
                  return ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () async {
                      await _imgFromCamera(context);
                    },
                  );
                }),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Profile"),
          centerTitle: true,
          backgroundColor: Color(c.appColor),
        ),
        body: Column(
          children: [
            TextButton(
              child: Text('Upload Images'),
              onPressed: () {
                _picker(context);
              },
            ),
            SizedBox(height: 10),
            TextButton(
              child: Text('View Gallery'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileImages(
                        pageTitle: 'Photo Gallery',
                        images: photos,
                        viewMode: c.EDITMODE)));
              },
            )
          ],
        ));
  }
}
