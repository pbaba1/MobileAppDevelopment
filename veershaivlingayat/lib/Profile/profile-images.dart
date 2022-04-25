import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;
// import 'package:firebase/firebase.dart';

class ProfileImages extends StatefulWidget {
  String pageTitle;
  List<dynamic> images;
  String viewMode;
  ProfileImages(
      {Key? key,
      required this.pageTitle,
      required this.images,
      required this.viewMode})
      : super(key: key);

  @override
  _ProfileImagesState createState() => _ProfileImagesState();
}

class _ProfileImagesState extends State<ProfileImages> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String userID = '';

  // display popup
  Widget _confirmImageDeletion(context, int imageIndex) {
    return AlertDialog(
        actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [Text('Confirmation'), SizedBox(height: 3)],
        ),
        content: const Text('Are you sure you want to delete this image?'),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // OK button
              TextButton(
                child: const Text('Yes', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  _deleteImageAndUpdateDB(imageIndex, context);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.greenAccent)),
              ),
              // CANCEL button
              TextButton(
                child: const Text('No', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent)),
              ),
            ],
          )
        ]);
  }

  _deleteImageFromStorage(String imagePath) {
    FirebaseStorage storage = FirebaseStorage.instance;
    storage.refFromURL(imagePath).delete();
  }

  _deleteImageAndUpdateDB(int imageIndex, BuildContext context) async {
    _deleteImageFromStorage(widget.images[imageIndex]);
    widget.images.removeAt(imageIndex);

    auth.authStateChanges().listen((User? u) {
      firestore
          .collection('users')
          .doc(u?.uid)
          .update({'photos': widget.images});
      firestore
          .collection('users')
          .doc(u?.uid)
          .get()
          .then((DocumentSnapshot snapshot) => {
                setState(() {
                  userID = snapshot['uid'];
                  widget.images = snapshot['photos'];
                  Navigator.of(context).pop();
                })
              });
    });
  }

  _setProfilePicture(int index) {
    auth.authStateChanges().listen((User? u) {
      firestore
          .collection('users')
          .doc(u?.uid)
          .update({'profile_picture': widget.images[index]});

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Updated your profile picture.")));
      // Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        backgroundColor: Color(c.appColor),
      ),
      body: SizedBox.fromSize(
        // size: const Size.fromHeight(500.0),
        child: widget.images.length > 0
            ? PageView.builder(
                controller: PageController(viewportFraction: 0.8),
                itemCount: widget.images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 8.0,
                    ),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          InteractiveViewer(
                            minScale: 0.1,
                            maxScale: 2.5,
                            child: Column(children: [
                              Image.network(
                                widget.images[index],
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 10),
                              widget.viewMode == c.EDITMODE
                                  ? Column(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        buildContext) =>
                                                    _confirmImageDeletion(
                                                        context, index));
                                          },
                                          iconSize: 25,
                                          color: Color(c.appColor),
                                        ),
                                        TextButton(
                                          child: Text(
                                              'Click to set this picture as profile picture'),
                                          onPressed: () {
                                            _setProfilePicture(index);
                                          },
                                        )
                                      ],
                                    )
                                  : Container()
                            ]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(child: const Text('No images have been uploaded')),
      ),
    );
  }
}
