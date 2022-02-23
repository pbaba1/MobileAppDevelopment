import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../body_content.dart';

class GoogleSignInProviderClass with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
      clientId:
          '382366113740-tbguuh4ovc2oe4dhh7rjl1iqhnuobekr.apps.googleusercontent.com');

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  User? existingUser;

  Future googleLogin(context) async {
    final googleUser = await _googleSignIn.signIn();
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    CollectionReference users = _firestore.collection('users');
    await FirebaseAuth.instance.signInWithCredential(credential);
    try {
      _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((DocumentSnapshot snapshot) async {
        if (!snapshot.exists) {
          await users.doc(FirebaseAuth.instance.currentUser!.uid).set({
            'fname': _user!.displayName!.split(' ')[0],
            'lname': _user!.displayName?.split(' ')[1],
            'email': _user!.email,
            'uid': _user!.id,
            'role': 'USER',
            'is_google_user': true,
            'user_creation_timestamp': DateTime.now(),
          });
        }
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BodyContent()));
      });
    } catch (e) {
      print('Error here... in singin with goole ~.~');
    }

    notifyListeners();
  }
}
