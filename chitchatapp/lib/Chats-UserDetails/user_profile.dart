import 'package:chitchatapp/Login-SignIn/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:chitchatapp/constants.dart' as c;
import 'package:flutter/services.dart';

class UserProfile extends StatefulWidget {
  final String? userImageURL;
  final String? displayName;
  final String? email;
  const UserProfile(
      {Key? key,
      required this.userImageURL,
      required this.displayName,
      required this.email})
      : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
            child: Center(
                child: Column(
              children: [
                // user profile photo
                CircleAvatar(
                    backgroundImage: widget.userImageURL == null
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
                const SizedBox(height: 5),
                // Email
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.email.toString(),
                        style: const TextStyle(
                            fontSize: 20, color: Colors.indigo)),
                    IconButton(
                      iconSize: 18,
                      color: Colors.grey,
                      icon: const Icon(Icons.copy_outlined),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: widget.email))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text(c.EMAIL_COPIED)));
                        });
                      },
                    )
                  ],
                )

                // TextButton(
                //     onPressed: () {
                //       _logout();
                //     },
                //     child: const Text('Logout'))
              ],
            )),
          ),
        ));
  }
}
