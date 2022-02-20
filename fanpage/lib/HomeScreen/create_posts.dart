import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePosts extends StatefulWidget {
  const CreatePosts({Key? key}) : super(key: key);

  @override
  _CreatePostsState createState() => _CreatePostsState();
}

class _CreatePostsState extends State<CreatePosts> {
  User? currentUser;
  final _postForm = GlobalKey<FormState>();
  final _messageController = TextEditingController();
  final CollectionReference<Map<String, dynamic>> _firebaseFirestore =
      FirebaseFirestore.instance.collection('posts');
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isPostingError = false;

  @override
  void initState() {
    super.initState();
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) {
        currentUser = user;
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
          'likes': 0,
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
              constraints: new BoxConstraints(minHeight: 275, maxHeight: 350),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Create Post',
                          style: TextStyle(color: Colors.black87, fontSize: 16),
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
                            'The message could not be posted. Please try again later.',
                            style: TextStyle(color: Colors.red, fontSize: 14))
                        : Container(),
                    (!_isPostingError && _messageController.text.length > 0)
                        ? const Text(
                            'Post created successfully! \nClose this popup to go back to the posts listing screen.',
                            style: TextStyle(color: Colors.green, fontSize: 14))
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
                            return 'Please enter a message to post.';
                          }
                        },
                        maxLines: 10,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1))),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        child: const Text("Create Post"),
                        onPressed: () {
                          _createPost();
                        },
                      ),
                    ]),
                  ])),
        )
      ]),
    ));
  }
}
