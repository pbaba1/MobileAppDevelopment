import 'package:chitchatapp/Chats-UserDetails/chats.dart';
// import 'package:chitchatapp/Chats-UserDetails/get_location.dart';
import 'package:chitchatapp/Login-SignIn/login.dart';
import 'package:chitchatapp/Chats-UserDetails/search.dart';
import 'package:chitchatapp/Chats-UserDetails/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BodyContent extends StatefulWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  String? userImageUrl = '';
  String? userName = '';
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Chats(),
    UserProfile(userImageURL: '', displayName: ''),
    // GetLocation()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userImageUrl = FirebaseAuth.instance.currentUser!.photoURL;
      userName = FirebaseAuth.instance.currentUser!.displayName;
    });
    userImageUrl ??= _fetchUserDetails();
  }

  _fetchUserDetails() {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    User? user;
    _firebaseAuth.authStateChanges().listen((User? u) {
      user = u;
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
            (Route route) => false);
      } else {
        _firebaseFirestore
            .collection('users')
            .doc(user?.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  setState(() {
                    userImageUrl = snapshot['image_url'];
                    userName = snapshot['display_name'];
                  })
                });
      }
    });
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ChitChat App'),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2_fill),
              label: 'Conversations',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profile',
            ),
            /* BottomNavigationBarItem(
              icon: Icon(Icons.location_on_sharp),
              label: 'Location',
            ), */
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.indigo,
          onTap: _onItemTapped,
        ),
        body: 

        _selectedIndex == 0
            ? const Chats()
            : UserProfile(userImageURL: userImageUrl, displayName: userName));
  }
}
