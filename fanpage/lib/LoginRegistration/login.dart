import 'dart:convert';

import 'package:fanpage/body_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:fanpage/LoginRegistration/register_user.dart';

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

  bool _isLoginSuccess = true;
  String errorMessage = '';

  String _generateMD5Value() {
    var content = new Utf8Encoder().convert(_passwordController.text);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return digest.toString();
  }

  InputDecoration _textDecorationValue(
      String labelTextValue,
      String hintTextValue,
      String fieldName,
      TextEditingController controller) {
    return InputDecoration(
        alignLabelWithHint: true,
        labelText: labelTextValue,
        // errorText: _errorText(fieldName, controller),
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

  _submit() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _generateMD5Value());
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Fan Page App',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                )),
            SizedBox(
              height: 10,
            ),
            _isLoginSuccess == false
                ? Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
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
                height: 35,
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
                child: const Text('Not registered? Click here to register',
                    style: TextStyle(color: Colors.lightBlue)),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterUser()))),
          ],
        ),
      ),
    ));
  }
}
