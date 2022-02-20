import 'package:fanpage/LoginRegistration/login.dart';
import 'package:fanpage/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'LoginRegistration/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDRkxVLTphGHtMXBbjC_-fFQb5YFpxa_mU',
          appId: '1:382366113740:android:ed70c98389bdb6a8f20769',
          messagingSenderId: '382366113740',
          projectId: 'fan-page-33fd1'));
  runApp(MyApp());
}

/* class MyApp extends StatelessWidget {
    final Future<FirebaseApp> _initializeApp = Firebase.initializeApp();
/* 
@override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignIn(),
      child: MaterialApp(
        title: 'FanPage',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          initialData: _initializeApp,
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(color: Colors.red);
            } else if (snapshot.connectionState == ConnectionState.done) {
              /* Future.delayed(Duration(seconds: 5), () {
              return Login();
            }); */

              return const Login();
            } else {
              return const Splash();
            }
          },
        ),
        debugShowCheckedModeBanner: false,
      )
      );

} */
 */
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initializeApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProviderClass(),
      child: MaterialApp(
        title: 'FanPage',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          initialData: _initializeApp,
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(color: Colors.red);
            } else if (snapshot.connectionState == ConnectionState.done) {
              /* Future.delayed(Duration(seconds: 5), () {
              return Login();
            }); */

              return const Login();
            } else {
              return const Splash();
            }
          },
        ),
        debugShowCheckedModeBanner: false,
      ));

  // This widget is the root of your application.
  /*  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FanPage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        initialData: _initializeApp,
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(color: Colors.red);
          } else if (snapshot.connectionState == ConnectionState.done) {
            /* Future.delayed(Duration(seconds: 5), () {
              return Login();
            }); */

            return const Login();
          } else {
            return const Splash();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
 */
}
