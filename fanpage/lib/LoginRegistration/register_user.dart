import 'dart:convert';

import 'package:fanpage/LoginRegistration/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart' as crypto;

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _registerForm = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool _isTextObscure = true;

  final FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;

  Widget fetchIcon(String fieldName) {
    switch (fieldName) {
      case 'fname':
      case 'lname':
        return Icon(Icons.person_outlined);
      case 'email':
        return Icon(Icons.email);
      case 'password':
        return IconButton(
            onPressed: () => setState(() {
                  if (_passwordController.text.trim() != '') {
                    _isTextObscure = !_isTextObscure;
                  }
                }),
            icon:
                Icon(_isTextObscure ? Icons.visibility_off : Icons.visibility));
      case 'cpassword':
        return Icon(Icons.visibility_off);
    }
    return Container();
  }

  InputDecoration _textDecorationValue(
      String labelTextValue, String hintTextValue, String fieldName) {
    return InputDecoration(
        alignLabelWithHint: true,
        suffixIcon: fetchIcon(fieldName),
        labelText: labelTextValue,
        hintText: hintTextValue);
  }

  String _generateMD5Value() {
    var content = new Utf8Encoder().convert(_passwordController.text);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return digest.toString();
  }

  _storeUserInDB(User? user) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference users = _firestore.collection('users');

    try {
      await users.doc(user!.uid).set({
        'fname': _firstNameController.text,
        'lname': _lastNameController.text,
        'email': _emailController.text,
        'password': _generateMD5Value(),
        'role': 'USER',
        'user_creation_timestamp': DateTime.now()
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('User created!')));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Login()),
          (Route route) => false);
    } catch (e) {
      print('there was an error storing the user in DB....');
      print(e);
    }
  }

  _registerUser() async {
    try {
      UserCredential userCredential =
          await _firebaseAuthInstance.createUserWithEmailAndPassword(
              email: _emailController.text, password: _generateMD5Value());
      if (userCredential.user != null) {
        _storeUserInDB(userCredential.user);
      }
      await _firebaseAuthInstance.signOut();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _registerForm,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Fan Page App',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                  )),
              // first name
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a valid first name';
                      }
                      return null;
                    },
                    controller: _firstNameController,
                    decoration: _textDecorationValue(
                        'First Name', 'First Name', 'fname')),
              ),
              // last name
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a valid last name';
                      }
                      return null;
                    },
                    controller: _lastNameController,
                    decoration:
                        _textDecorationValue('Last Name', 'Last Name', 'lname')),
              ),
        
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter an email address';
                      } else if (!value.contains('@')) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: _textDecorationValue('Email', 'Email', 'email')),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration:
                      _textDecorationValue('Password', 'Password', 'password'),
                  obscureText: _isTextObscure,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a password to confirm';
                    } else if (value != _passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  decoration: _textDecorationValue(
                      'Confirm Password', 'Confirm Password', 'cpassword'),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  height: 35,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      _registerForm.currentState!.validate()
                          ? _registerUser()
                          : null;
                    },
                  )),
              const SizedBox(height: 10),
              InkWell(
                  child: const Text('Click here to login',
                      style: TextStyle(color: Colors.lightBlue)),
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Login()))),
            ],
          ),
        ),
      ),
    ));
  }
}
