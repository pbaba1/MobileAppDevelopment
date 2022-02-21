import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'LoginRegistration/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final Future<FirebaseApp> _initializeApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
          CircleAvatar(
              backgroundImage: AssetImage('assets/splash_screen_img.jpg'),
              radius: 150),
          SizedBox(height: 5),
          Text(
            'Loading...',
            style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ])));
  }
}
