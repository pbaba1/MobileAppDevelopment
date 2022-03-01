import 'package:chitchatapp/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserProfile extends StatefulWidget {
  final String? userImageURL;
  final String? displayName;
  const UserProfile(
      {Key? key, required this.userImageURL, required this.displayName})
      : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  _logout() async {
    await FirebaseAuth.instance.signOut();
    final GoogleSignIn _googleSignIn = GoogleSignIn(
        clientId:
            '172976090138-upc2i80p6q4juq8oq7fru3clahk8ko64.apps.googleusercontent.com');
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
          centerTitle: true,
          title: const Text('ChitChat App'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
            child: Center(
                child: Column(
              children: [
                // user profile photo
                CircleAvatar(
                    backgroundImage: widget.userImageURL.toString() == null
                        ? const AssetImage('assets/dummy_user.jpg')
                            as ImageProvider
                        : NetworkImage(widget.userImageURL!),
                    radius: 100),
                const SizedBox(height: 15),
                // User Name
                Text(widget.displayName.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                    )),

                TextButton(
                    onPressed: () {
                      _logout();
                    },
                    child: const Text('Logout'))
              ],
            )),
          ),
        ));
  }
}