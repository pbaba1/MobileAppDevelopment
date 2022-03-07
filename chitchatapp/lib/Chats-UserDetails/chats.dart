import 'package:chitchatapp/Chats-UserDetails/chat_with_user.dart';
import 'package:chitchatapp/Chats-UserDetails/user_directory.dart';
import 'package:chitchatapp/Widgets/conversationList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart' as FBA;
import 'package:flutter/material.dart';

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
    var snapshot =
        await FirebaseFirestore.instance.collection('messages').get();
    var list = snapshot.docs.map((doc) => [doc.data()['messages'], doc.id]);
    list.forEach((element) {
      print('Printing element!!!');
      print(element);
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

    // print('&&&&&&&&&&&&&&&&&&&&&');
    // print(users);

    for (var u in users) {
      FirebaseFirestore.instance
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
                messageText: '',
                imageURL: snapshot['image_url'],
                time: snapshot['user_creation_timestamp']));
          });
        }
      });
    }

    print(chatUsers);
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
