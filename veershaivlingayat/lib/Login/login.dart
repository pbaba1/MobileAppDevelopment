import 'package:flutter/material.dart';

import '../Homepage/homepage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _visibility = true;
  // ignore: non_constant_identifier_names
  bool email_success = true;
  // ignore: non_constant_identifier_names
  bool password_success = true;

  void _login() async {
    try {
      // await _auth.signInWithEmailAndPassword(
      //   email: _username.text.toLowerCase(),
      //   password: _password.text,
      // );
      if (_username.text == 'admin' && _password.text == 'admin') {
        setState(() {
          email_success = true;
          password_success = true;
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Logging in.......")));
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const Homepage()));
        });
      }
    } catch (e) {
      // if (e.code == 'user-not-found') {
      //   setState(() {
      //     email_success = false;
      //     password_success = true;
      //   });
      // } else if (e.code == 'wrong-password') {
      //   setState(() {
      //     email_success = true;
      //     password_success = false;
      //     _password.clear();
      //   });
      // }
      print('logging issue');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: const Text("Login Page"),
        //   centerTitle: true,
        //   backgroundColor: Colors.red.shade700,
        // ),
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
                        email_success
                            ? (password_success
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
                                return "Please enter a username";
                              }
                              return null;
                            },
                            controller: _username,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                                labelText: 'Username',
                                hintText: 'Enter username',
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
                          // print("hello");
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: const Color(0xFFCA0000),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5.0)),
                    FlatButton(
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => const ForgotPassword()));
                        print("Forgot");
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
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (_) => const Signup()));
                        print("Register");
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
