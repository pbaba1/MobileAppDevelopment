import 'dart:convert';
import 'package:fanpage/LoginRegistration/google_sign_in.dart';
import 'package:fanpage/body_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:fanpage/LoginRegistration/register_user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isTextObscure = true;
  User? user;
  bool email_success = false;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  bool _isLoginSuccess = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) {
        _firebaseFirestore
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BodyContent()),
                      (Route route) => false)
                });
      }
    });
  }

  InputDecoration _textDecorationValue(
      String labelTextValue,
      String hintTextValue,
      String fieldName,
      TextEditingController controller) {
    return InputDecoration(
        alignLabelWithHint: true,
        labelText: labelTextValue,
        suffixIcon: fieldName == 'email'
            ? const Icon(Icons.email)
            : IconButton(
                onPressed: () => setState(() {
                      if (_passwordController.text.trim() != '') {
                        _isTextObscure = !_isTextObscure;
                      }
                    }),
                icon: Icon(
                    _isTextObscure ? Icons.visibility_off : Icons.visibility)),
        hintText: hintTextValue);
  }

  // forget password
  Future _resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);

      setState(() {
        email_success = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("An email has been sent to the registered email ID")));

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const Login()),
          (Route route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          email_success = false;
        });
      }
    }
  }

  _submit() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      user = userCredential.user;
      if (user != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const BodyContent()));
      }
    } on FirebaseException catch (e) {
      setState(() {
        _isLoginSuccess = false;
        _passwordController.clear();
        errorMessage = e.message.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
              const SizedBox(
                height: 10,
              ),
              !_isLoginSuccess
                  ? Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter email';
                      } else if (!text.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: _textDecorationValue(
                        'Email', 'Email', 'email', _emailController)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: TextFormField(
                  onChanged: (value) => _isLoginSuccess = true,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter password';
                    } else if (text.length < 6) {
                      return 'Please enter password of atleast 6 characters.';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration: _textDecorationValue(
                      'Password', 'Password', 'password', _passwordController),
                  obscureText: _isTextObscure,
                ),
              ),
              Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      _formKey.currentState!.validate() ? _submit() : null;
                    },
                  )),
              const SizedBox(height: 10),
              InkWell(
                  child: const Text('Forgot Password?',
                      style: TextStyle(color: Colors.lightBlue)),
                  onTap: () async {
                    await _resetPassword();
                  }),
              const SizedBox(height: 15),
              const Text('OR', style: TextStyle(letterSpacing: 1.2)),
              const SizedBox(height: 15),
              Container(
                  height: 35,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton.icon(
                    icon: const FaIcon(FontAwesomeIcons.google),
                    label: const Text(
                      'Google Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProviderClass>(
                          context,
                          listen: false);
                      provider.googleLogin(context);
                    },
                  )),
              const SizedBox(height: 10),
              InkWell(
                  child: const Text('Not registered? Click here to register',
                      style: TextStyle(color: Colors.lightBlue)),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterUser()))),
            ],
          ),
        ),
      ),
    ));
  }
}
