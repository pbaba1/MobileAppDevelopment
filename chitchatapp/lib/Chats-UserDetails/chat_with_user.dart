import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class ChatWithUser extends StatefulWidget {
  final String? userImageURL;
  final String? displayName;
  final String? email;
  const ChatWithUser(data,
      {Key? key,
      required this.userImageURL,
      required this.displayName,
      required this.email})
      : super(key: key);

  @override
  _ChatWithUserState createState() => _ChatWithUserState();
}

class _ChatWithUserState extends State<ChatWithUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ReCase(widget.displayName.toString()).titleCase.toString()),
        centerTitle: true,
      ),
    );
  }
}
