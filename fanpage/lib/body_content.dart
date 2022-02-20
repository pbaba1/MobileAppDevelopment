import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanpage/HomeScreen/create_posts.dart';
import 'package:fanpage/LoginRegistration/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BodyContent extends StatefulWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  final List _listOfPosts = [];
  String userRole = '';
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String fname = '';
  String lname = '';

  @override
  void initState() {
    super.initState();
    // get user details
    _fetchUserDetails();
    // get posts
    _getPosts();
  }

  void _fetchUserDetails() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
            (Route route) => false);
      } else {
        _firebaseFirestore
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  setState(() {
                    userRole = snapshot['role'];
                    fname = snapshot['fname'];
                    lname = snapshot['lname'];
                  })
                });
      }
    });
  }

  void _getPosts() {
    // _firebaseFirestore.
  }

  bool _isAdmin(String userRole) {
    return userRole == 'ADMIN';
  }

  Widget _logout(context) {
    return AlertDialog(
        actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [Text('Confirmation'), SizedBox(height: 3)],
        ),
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent)),
              ),
              TextButton(
                child: const Text('Ok', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  await _firebaseAuth.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                      (Route route) => false);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
              ),
            ],
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _isAdmin(userRole)
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                tooltip: 'Add Post',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const CreatePosts();
                      });
                },
              )
            : null,
        appBar: AppBar(
          title: const Text('Fan Page App'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout_sharp),
              tooltip: 'Logout',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext buildContext) => _logout(context));
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _listOfPosts.isEmpty
                  ? const Text('There are no posts to show.')
                  : ListView(),
            ],
          ),
        ));
  }
}
