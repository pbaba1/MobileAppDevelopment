import 'package:chitchatapp/login.dart';
import 'package:chitchatapp/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BodyContent extends StatefulWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  _BodyContentState createState() => _BodyContentState();
}

_logout(context) {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
            ),
            TextButton(
              child: const Text('Ok', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await _firebaseAuth.signOut();
                final GoogleSignIn _googleSignIn = GoogleSignIn(
                    clientId:
                        '172976090138-upc2i80p6q4juq8oq7fru3clahk8ko64.apps.googleusercontent.com');
                await _googleSignIn.disconnect();
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

class _BodyContentState extends State<BodyContent> {
  String? userImageUrl = '';
  String? userName = '';

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
                    userName = snapshot['fname'] + ' ' + snapshot['lname'];
                  })
                });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ChitChat App'), actions: <Widget>[
      // display user icon
      InkWell(
        child: SizedBox(
          height: 35,
          width: 35,
          child: CircleAvatar(
            backgroundImage: (userImageUrl.toString() == 'null' ||
                    userImageUrl.toString() == '')
                ? const AssetImage('assets/dummy_user.jpg') as ImageProvider
                : NetworkImage(userImageUrl.toString()),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserProfile(
                      userImageURL: userImageUrl, displayName: userName)));
        },
      ),
      SizedBox(
        width: 10,
      )
      /*  IconButton(
        icon: const Icon(Icons.logout_sharp),
        tooltip: 'Logout',
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext buildContext) => _logout(context));
        },
      ) */
    ]));
  }
}
