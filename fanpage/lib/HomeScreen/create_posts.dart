// import 'dart:html';
import 'dart:io' as i;
import 'dart:typed_data';
import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FBA;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as FBS;
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:path/path.dart';

class CreatePosts extends StatefulWidget {
  const CreatePosts({Key? key}) : super(key: key);

  @override
  _CreatePostsState createState() => _CreatePostsState();
}

class _CreatePostsState extends State<CreatePosts> {
  FBA.User? currentUser;
  final _postForm = GlobalKey<FormState>();
  final _messageController = TextEditingController();
  final CollectionReference<Map<String, dynamic>> _firebaseFirestore =
      FirebaseFirestore.instance.collection('posts');
  final FirebaseFirestore _firebaseFirestoreUsers = FirebaseFirestore.instance;
  final FBA.FirebaseAuth _firebaseAuth = FBA.FirebaseAuth.instance;
  bool _isPostingError = false;
  String? userName = '';
  var downloadUrl;
  i.File _imageFile = new i.File('');

  @override
  void initState() {
    super.initState();
    _firebaseAuth.authStateChanges().listen((FBA.User? user) {
      if (user != null) {
        currentUser = user;

        _firebaseFirestoreUsers
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  setState(() {
                    userName = snapshot['fname'] + ' ' + snapshot['lname'];
                  })
                });
      }
    });
  }

  _createPost() async {
    if (_postForm.currentState!.validate()) {
      try {
        await _firebaseFirestore.add({
          'message': _messageController.text,
          'posted_at': DateTime.now(),
          'posted_by': currentUser?.uid,
          'posted_by_name': userName,
          'likes': [],
          'image_url': downloadUrl
        });
        setState(() {
          _isPostingError = false;
        });
      } catch (e) {
        setState(() {
          _isPostingError = true;
        });
        print('Error creating a post :/' + e.toString());
      }
    }
  }

  _imagePickerWeb({required Function(html.File file) onSelected}) {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = '.png,.jpg,.jpeg';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      html.File file = uploadInput.files!.first;
      final reader = html.FileReader();
      reader.readAsDataUrl(file);
      print('FILe is');
      print(file.toString());
      reader.onLoadEnd.listen((event) {
        onSelected(file);
      });
    });
  }

  _imagePicker(context) async {
    print('DEFAULTTARGETPLATFORM');
    print(defaultTargetPlatform);
    if (defaultTargetPlatform == TargetPlatform.windows) {
    } else {
      final picker = ImagePicker();
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      setState(() {
        _imageFile = i.File(pickedFile!.path);
      });
    }

    _uploadToFirebase(context);
  }

  _uploadToStorage() {
    final dateTime = DateTime.now();
    FBS.FirebaseStorage storage = FBS.FirebaseStorage.instance;
    _imagePickerWeb(onSelected: (file) async {
      i.File newFile = file as i.File;
      FBS.Reference ref =
          storage.ref().child('images/' + DateTime.now().toString());
      FBS.UploadTask uploadTask = ref.putFile(newFile);
      uploadTask.then((res) {
        res.ref.getDownloadURL();
      });

      downloadUrl = await (await uploadTask).ref.getDownloadURL();
    });
  }

  Future _uploadToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile.path);
    FBS.FirebaseStorage storage = FBS.FirebaseStorage.instance;
    FBS.Reference ref =
        storage.ref().child('images/' + DateTime.now().toString());
    FBS.UploadTask uploadTask = ref.putFile(_imageFile);
    uploadTask.then((res) {
      res.ref.getDownloadURL();
    });

    downloadUrl = await (await uploadTask).ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _postForm,
      child: Stack(alignment: Alignment.center, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 350, maxHeight: 350),
              child: SingleChildScrollView(
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Create Post',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          IconButton(
                            icon: const Icon(Icons.cancel_outlined),
                            tooltip: 'Close',
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      _isPostingError
                          ? const Text(
                              'The message could not be posted. Please try again later',
                              style: TextStyle(color: Colors.red, fontSize: 14))
                          : Container(),
                      (!_isPostingError && _messageController.text.length > 0)
                          ? const Text(
                              'Post created successfully! \nClose this popup to go back to the posts listing screen',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 14))
                          : Container(),
                      const SizedBox(height: 10),
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: _messageController,
                          validator: (value) {
                            if (value!.trim().length > 140) {
                              return 'Maximum characters length is 140.';
                            } else if (value == null || value.trim() == '') {
                              return 'Please enter a message to post';
                            }
                          },
                          maxLines: 10,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1))),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              child: const Text("Create Post"),
                              onPressed: () {
                                _createPost();
                              },
                            ),
                            ElevatedButton(
                              child: const Text("Upload Image"),
                              onPressed: () {
                                if (defaultTargetPlatform.toString() ==
                                    TargetPlatform.windows.toString()) {
                                  _uploadToStorage();
                                } else {
                                  _imagePicker(context);
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ]),
                    ]),
              )),
        )
      ]),
    ));
  }
}
