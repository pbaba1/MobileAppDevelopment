import 'package:chitchatapp/Widgets/conversationList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FBA;
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../Login-SignIn/login.dart';
import '../models/chat_users_model.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<ChatUsers> chatUsers = [];
  String currentUserID = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      currentUserID = FBA.FirebaseAuth.instance.currentUser!.uid;
    });

    _fetchUserDetails();
    _fetchConversations();
  }

  _fetchUserDetails() async {
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
        print('WHATS IS USER UID: ' + user!.uid);
        _firebaseFirestore
            .collection('users')
            .doc(user?.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  setState(() {
                    currentUserID = snapshot.id;
                  })
                });
      }
    });
  }

  _fetchConversations() async {
    List<String> users = [];
    List<Timestamp> time = [];
    List<String> messages = [];
    var snapshot =
        await FirebaseFirestore.instance.collection('messages').get();
    var list = snapshot.docs.map((doc) => [doc.data()['messages'], doc.id]);
    list.forEach((element) {
      print('Printing element!!!');
      print(element[0]);
      time.add(element[0][element[0].length - 1]['createdAt']);
      messages.add(element[0][element[0].length - 1]['content']);

      print('MESSAGES IS::: ');
      print(messages);
      print(time);
      // print(element[0]);
      if (element[1].contains(currentUserID)) {
        for (var el in element[0]) {
          if (!users.contains(el['createdBy'])) {
            users.add(el['createdBy']);
          }
        }

        String newID = element[1].replaceAll(currentUserID, '').trim();
        if (!users.contains(newID)) {
          users.add(newID);
        }
      }
    });

    int i = 1;
    for (var u in users) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(u)
          .get()
          .then((DocumentSnapshot snapshot) {
        if (u != currentUserID) {
          setState(() {
            print('snapshot ID: ' + snapshot.id);
            print('currentUserID ' + currentUserID);
            chatUsers.add(ChatUsers(
                email: snapshot['email'],
                userID: snapshot.id,
                name: snapshot['display_name'],
                messageText: messages[i],
                imageURL: snapshot['image_url'],
                time: time[i]));
            i++;
          });
        }
      });
      chatUsers.sort((a, b) => b.time.compareTo(a.time));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ListView.builder(
            itemCount: chatUsers.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 16),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ConversationList(
                name: chatUsers[index].name,
                messageText: chatUsers[index].messageText,
                imageUrl: chatUsers[index].imageURL,
                userID: chatUsers[index].userID,
                email: chatUsers[index].email,
                time: chatUsers[index]
                    .time, /* isMessageRead: (index == 0 || index == 3) ? true : false */
              );
            }),
      ),
    );
  }
}
