import 'package:chitchatapp/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chitchatapp/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCYsAV41QbcsWawW0HYxl8brwqM2cmcilI',
          appId: '1:172976090138:android:d39437e71ef445871175a3',
          messagingSenderId: '430535446155',
          projectId: 'chit-chat-app-79874',
          storageBucket: 'chit-chat-app-79874.appspot.com'));
  runApp(const MyApp());
}

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
        title: 'ChitChat App',
        theme: ThemeData(
          // primaryColor: Color(0xff000c66),
          primarySwatch: Colors.indigo,
          // colorScheme: Colors.indigo[800]
        ),
        home: FutureBuilder(
          initialData: _initializeApp,
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(color: Colors.red);
            } else if (snapshot.connectionState == ConnectionState.done) {
              return const Login();
            }
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(),
                    ),
                    SizedBox(height: 15),
                    Text('Loading...', style: TextStyle(fontSize: 24))
                  ],
                ),
              ),
            );
          },
        ),
        debugShowCheckedModeBanner: false,
      ));
}