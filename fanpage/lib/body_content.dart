import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanpage/HomeScreen/create_posts.dart';
import 'package:fanpage/LoginRegistration/google_sign_in.dart';
import 'package:fanpage/LoginRegistration/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class BodyContent extends StatefulWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  List _listOfPosts = [];
  User? user;
  String userRole = '';
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String userName = '';
  bool _isDataFetching = true;
  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('posts')
      .orderBy('posted_at')
      .snapshots();
  var format = DateFormat("M/d/y hh:mm a");

  @override
  void initState() {
    // userName = GoogleSignInProviderClass().getUserName()!;
    // print('&&&&&&&&&&' + userName.toString());
    super.initState();
    // get user details
    _fetchUserDetails();
    // get posts
    _getPosts();
  }

  void _fetchUserDetails() {
    _firebaseAuth.authStateChanges().listen((User? u) {
      user = u;
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
            (Route route) => false);
      } else {
        _firebaseFirestore
            .collection('users')
            .doc(user?.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  setState(() {
                    userRole = snapshot['role'];
                    /*  fname = snapshot['fname'];
                    lname = snapshot['lname']; */
                    userName = snapshot['fname'] + ' ' + snapshot['lname'];
                    print('&&&&&&&&&&' + userName.toString());
                  })
                });
      }
    });
  }

  void _getPosts() async {
    CollectionReference<Map<String, dynamic>> _fsGetPosts =
        FirebaseFirestore.instance.collection('posts');
    QuerySnapshot querySnapshot = await _fsGetPosts.get();

    _listOfPosts = querySnapshot.docs.map((doc) => doc.data()).toList();
    _isDataFetching = false;
    print('###############');
    print(_listOfPosts);
  }

  bool _isAdmin(String userRole) {
    return userRole == 'ADMIN';
  }

  Widget _logout(context) {
    return AlertDialog(
        actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [Text('Confirmation'), SizedBox(height: 3)],
        ),
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent)),
              ),
              TextButton(
                child: const Text('Ok', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  await _firebaseAuth.signOut();
                  final GoogleSignIn _googleSignIn = GoogleSignIn(
                      scopes: [
                        'email',
                        'https://www.googleapis.com/auth/contacts.readonly',
                      ],
                      clientId:
                          '382366113740-tbguuh4ovc2oe4dhh7rjl1iqhnuobekr.apps.googleusercontent.com');
                  await _googleSignIn.disconnect();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                      (Route route) => false);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
              ),
            ],
          )
        ]);
  }

  Widget _displayPostDetails(String? postedBy) {
    CollectionReference col = _firebaseFirestore.collection('users');
    Query query = col.where('posted_by', isEqualTo: postedBy);
    print('*&*&*&*&**&');
    print(query.get());
    query.get();
    // Stream<QuerySnapshot<Map<String, dynamic>>> user = _firebaseFirestore
    // .collection('users')
    // .where('posted_by', isEqualTo: postedBy));

    return Text('hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _isAdmin(userRole)
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                tooltip: 'Add Post',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const CreatePosts();
                      });
                },
              )
            : null,
        appBar: AppBar(
          title: const Text('Fan Page App'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout_sharp),
              tooltip: 'Logout',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext buildContext) => _logout(context));
              },
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _messageStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text("An error occurred. Please try again later",
                      style: TextStyle(fontSize: 20.0, color: Colors.red)));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  // child: Text("Loading....",
                  //     style: TextStyle(fontSize: 20.0, color: Colors.red)));
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));
            }

            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Text('No messages available.',
                      style: TextStyle(fontSize: 20.0, color: Colors.red)));
            }

            // No error/wait time return listview
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return Column(
                  children: [
                    Row(children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, bottom: 3.0, left: 20.0),
                            child: Text(
                              data['posted_by_name'].toString(),
                              textAlign: TextAlign.left,
                            ),
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, bottom: 3.0, right: 20.0),
                            child: Text(
                              format
                                  .format(data['posted_at'].toDate())
                                  .toString(),
                              textAlign: TextAlign.right,
                            ),
                          )),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        title: Text(
                          data['message'],
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.justify,
                        ),
                        tileColor: Colors.white,
                      ),
                    ),
                  ],
                );
              }).toList(),
            );
          },
        ));
  }
}
