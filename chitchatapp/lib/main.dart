import 'package:chitchatapp/Login-SignIn/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chitchatapp/Login-SignIn/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chitchatapp/constants.dart' as c;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: c.apiKey,
    projectId: c.projectId,
    storageBucket: c.storageBucket,
    messagingSenderId: c.messagingSenderId,
    appId: c.appId,
  ));
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
          primarySwatch: Colors.indigo,
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
