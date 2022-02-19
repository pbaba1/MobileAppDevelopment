import 'package:flutter/material.dart';

class CreatePosts extends StatefulWidget {
  const CreatePosts({Key? key}) : super(key: key);

  @override
  _CreatePostsState createState() => _CreatePostsState();
}

class _CreatePostsState extends State<CreatePosts> {
  final _postForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(
                    content: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          // right: -40.0,
                          // top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(
                          key: _postForm,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  child: Text("Create Post"),
                                  onPressed: () {
                                    if (_postForm.currentState!.validate()) {
                                      _postForm.currentState!.save();
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
