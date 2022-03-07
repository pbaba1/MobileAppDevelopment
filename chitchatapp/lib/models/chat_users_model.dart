import 'package:cloud_firestore/cloud_firestore.dart';

class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  Timestamp time;
  String email;
  String userID;
  ChatUsers(
      {required this.name,
      required this.messageText,
      required this.imageURL,
      required this.time,
      required this.email,
      required this.userID});
}
