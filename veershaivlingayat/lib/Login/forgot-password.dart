import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Login/login.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class ForgotPassword extends StatefulWidget {
  String pageTitle;
  ForgotPassword({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool email_success = false;
  final _form = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  Future _resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

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
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Email address not found')));
          _emailController.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(widget.pageTitle), backgroundColor: Color(c.appColor)),
        body: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset('assets/vsl_logo.png'),
                  const SizedBox(height: 20),
                  const Text(
                    'Please enter your email address associated with your account',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!value.contains('@')) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: 'Enter email address',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      _form.currentState!.validate() ? _resetPassword() : null;
                    },
                    child: Text(
                      'Send Password Reset Link',
                      style: TextStyle(
                          color: Color(c.appColor),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
