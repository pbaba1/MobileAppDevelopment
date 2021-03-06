import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Chats-UserDetails/body_content.dart';
import 'package:chitchatapp/services/constants.dart' as Constants;

class GoogleSignInProviderClass with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId:
          '172976090138-upc2i80p6q4juq8oq7fru3clahk8ko64.apps.googleusercontent.com');

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
            'display_name': _user!.displayName?.toLowerCase(),
            'email': _user!.email,
            'uid': _user!.id,
            'role': 'USER',
            'image_url': _user!.photoUrl,
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
