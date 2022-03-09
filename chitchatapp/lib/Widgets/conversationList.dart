import 'package:chitchatapp/Chats-UserDetails/chat_with_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  Timestamp time;
  String userID;
  String email;
  Timestamp dateCreated;
  // bool isMessageRead;
  ConversationList({
    Key? key,
    required this.name,
    required this.messageText,
    required this.imageUrl,
    required this.time,
    required this.userID,
    required this.dateCreated,
    required this.email,
    /* required this.isMessageRead */
  }) : super(key: key);
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatWithUser(
                    dateCreated: widget.dateCreated,
                    userID: widget.userID,
                    userImageURL: widget.imageUrl,
                    displayName: widget.name,
                    email: widget.email)));
      },
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.imageUrl),
                        maxRadius: 30,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                ReCase(widget.name).titleCase,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                widget.messageText,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  DateFormat("H:m, MMMM d y")
                      .format(DateTime.fromMillisecondsSinceEpoch(
                          widget.time.seconds * 1000))
                      .toString(),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const Divider(height: 1, color: Colors.grey)
              ],
            ),
          ),
          const Divider(height: 1)
        ],
      ),
    );
  }
}
