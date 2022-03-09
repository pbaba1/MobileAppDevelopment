import 'package:chitchatapp/Chats-UserDetails/chats.dart';
import 'package:chitchatapp/Chats-UserDetails/user_directory.dart';
import 'package:chitchatapp/Login-SignIn/login.dart';
import 'package:chitchatapp/Chats-UserDetails/user_profile.dart';
import 'package:chitchatapp/services/get_current_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:chitchatapp/services/constants.dart' as c;

class BodyContent extends StatefulWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  String? userImageUrl = '';
  String? userName = '';
  String? email = '';
  String currentUserID = '';
  DateTime dateCreated = DateTime.now();
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Chats(),
    const UserDirectory(),
    const SizedBox(),
    const GetCurrentLocation(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userImageUrl = FirebaseAuth.instance.currentUser!.photoURL;
      userName = FirebaseAuth.instance.currentUser!.displayName;
      email = FirebaseAuth.instance.currentUser!.email;
      currentUserID = FirebaseAuth.instance.currentUser!.uid;
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
                    email = snapshot['email'];
                    dateCreated = snapshot['user_creation_timestamp'];
                    currentUserID = snapshot.id;
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

  _logout() async {
    await FirebaseAuth.instance.signOut();
    final GoogleSignIn _googleSignIn = c.googleSignIn;
    await _googleSignIn.disconnect();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
        (Route route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ChitChat App'),
          centerTitle: true,
          actions: [
            _selectedIndex == 2
                ? IconButton(
                    onPressed: () {
                      _logout();
                    },
                    icon: const Icon(Icons.logout))
                : const SizedBox()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2_fill),
              label: 'Conversations',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_alt_rounded,
              ),
              label: 'User Directory',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.indigo,
          onTap: _onItemTapped,
        ),
        body: _selectedIndex == 2
            ? UserProfile(
                userID: currentUserID,
                dateCreated: Timestamp.fromDate(dateCreated),
                userImageURL: userImageUrl,
                displayName: userName,
                email: email)
            : _widgetOptions[_selectedIndex]);
  }
}
