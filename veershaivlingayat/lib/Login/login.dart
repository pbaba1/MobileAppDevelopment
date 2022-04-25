// import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/homepage.dart';
import 'package:veershaivlingayat/Login/forgot-password.dart';
import 'package:veershaivlingayat/Login/register.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _visibility = true;
  bool emailSuccess = true;
  bool passwordSuccess = true;
  User? user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        firestore
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Homepage(
                                pageTitle: 'Welcome',
                              )),
                      (Route route) => false)
                });
      }
    });
  }

  _updateLastVisitedTime(DateTime? lastSignInTime) {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        firestore
            .collection('users')
            .doc(user.uid)
            .update({'last_visited_timestamp': lastSignInTime});
      }
    });
  }

  void _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _username.text.trim(), password: _password.text);
      user = userCredential.user;
      if (user != null) {
        _updateLastVisitedTime(user?.metadata.lastSignInTime);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Homepage(
                  pageTitle: 'Welcome!',
                )));
      }
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          emailSuccess = false;
          passwordSuccess = true;
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          emailSuccess = true;
          passwordSuccess = false;
          _password.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _form,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset('assets/vsl_logo.png')),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        emailSuccess
                            ? (passwordSuccess
                                ? ''
                                : 'Wrong password provided.')
                            : 'No user found for that username.',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0, bottom: 0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email address";
                              }
                              return null;
                            },
                            controller: _username,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                                labelText: 'Email Address',
                                hintText: 'Enter email address',
                                suffix: const Icon(Icons.person)),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a password";
                              }
                              return null;
                            },
                            controller: _password,
                            obscureText: _visibility,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              labelText: 'Password',
                              hintText: 'Enter password',
                              suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    _visibility = !_visibility;
                                  });
                                },
                                child: Icon(
                                  _visibility
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .5,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(32.0)),
                      child: FlatButton(
                        onPressed: () {
                          _form.currentState!.validate() ? _login() : null;
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Color(c.appColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5.0)),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ForgotPassword(
                                    pageTitle: 'Forgot Password')));
                        // print("Forgot");
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Register()));
                      },
                      child: const Text(
                        'New User? Register Here',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
