// ignore_for_file: deprecated_member_use
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // FirebaseAuth auth = FirebaseAuth.instance;
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _imageURL = "Null";
  String _name = "Pooja Basavraj Baba";
  bool _isImageUploadError = false;
  var _downloadUrl = '';
  File _imageFile = new File('');
  final TextEditingController _displayname = TextEditingController();
  final TextEditingController _messages = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   firestore
  //       .collection("users")
  //       .doc(auth.currentUser?.uid)
  //       .get()
  //       .then((DocumentSnapshot snapshot) {
  //     if (snapshot['imageURL'] != "Null") {
  //       setState(() {
  //         _imageURL = snapshot['imageURL'];
  //       });
  //     } else {
  //       setState(() {
  //         _imageURL = "Null";
  //       });
  //     }
  //     setState(() {
  //       _name = snapshot["displayName"];
  //       _motto = snapshot["motto"];
  //     });
  //   });
  // }

  // _update(context, _newName, _newImageURL, _newMotto) async {
  //   await firestore
  //       .collection("users")
  //       .doc(auth.currentUser?.uid)
  //       .get()
  //       .then((DocumentSnapshot snapshot) {
  //     firestore.collection("users").doc(snapshot['uid']).set({
  //       'uid': snapshot['uid'],
  //       'displayName': _newName,
  //       'email': snapshot['email'],
  //       'imageURL': _imageURL,
  //       "createdAt": snapshot['createdAt'],
  //       "displayNameLower": _newName.toLowerCase(),
  //       "rating": snapshot['rating'],
  //       "countOfRaters": snapshot['countOfRaters'],
  //       "motto": _newMotto
  //     });
  //   });
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => Profile(
  //                 user: firestore
  //                     .collection("users")
  //                     .doc(auth.currentUser?.uid)
  //                     .get(),
  //                 fromPage: "edit",
  //                 fromHome: false,
  //                 isSelf: true,
  //               )));
  // }

  // Future _uploadToFirebase(BuildContext context) async {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("Uploading the picture....")));

  //   FirebaseStorage storage = FirebaseStorage.instance;
  //   Reference ref = storage.ref().child('images/' + DateTime.now().toString());
  //   try {
  //     UploadTask uploadTask = ref.putFile(_imageFile);
  //     uploadTask.then((res) {
  //       res.ref.getDownloadURL();
  //     });

  //     _downloadUrl = await (await uploadTask).ref.getDownloadURL();
  //     setState(() {
  //       _imageURL = _downloadUrl;
  //     });
  //     setState(() {
  //       _isImageUploadError = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _isImageUploadError = true;
  //     });
  //   }
  // }

  _imgFromCamera(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });

    Navigator.of(context).pop();
    // _uploadToFirebase(context);
  }

  _imgFromGallery(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });

    Navigator.of(context).pop();
    // _uploadToFirebase(context);
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
    );
  }
}
