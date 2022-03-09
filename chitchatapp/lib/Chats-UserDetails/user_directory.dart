import 'package:chitchatapp/Chats-UserDetails/chat_with_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Login-SignIn/login.dart';
import 'package:recase/recase.dart';

class UserDirectory extends StatefulWidget {
  const UserDirectory({Key? key}) : super(key: key);

  @override
  _UserDirectoryState createState() => _UserDirectoryState();
}

class _UserDirectoryState extends State<UserDirectory> {
  Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('users').snapshots();
  String? loggedInUserName = '';
  DateTime dateCreated = DateTime.now();

  @override
  initState() {
    super.initState();
    _fetchUserDetails();
  }

  _fetchUserDetails() {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    User? user;
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
                    loggedInUserName = snapshot['display_name'];
                    dateCreated = snapshot['user_creation_timestamp'];
                  })
                });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        title: const Text('ChatApp'),
      ), */
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  print('*************VALUE IS: ' + value);
                  setState(() {
                    _users = FirebaseFirestore.instance
                        .collection('users')
                        .where('display_name', isGreaterThanOrEqualTo: value)
                        .where('display_name', isLessThan: value + '\uf7ff')
                        .snapshots();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search user",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            const SizedBox(height: 5),
            // LIST OF CONTACTS
            StreamBuilder<QuerySnapshot>(
              stream: _users,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error fetching the user directory',
                      style: TextStyle(fontSize: 18, color: Colors.red));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(color: Colors.indigo)),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No users present',
                        style: TextStyle(fontSize: 18, color: Colors.indigo)),
                  );
                }
                return ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    double r = 0;
                    if (data['rating'].isNotEmpty) {
                      r = data['rating']
                          .fold(0, (previous, current) => (previous + current));
                      r = (r / data['rating'].length);
                    }

                    return Column(children: [
                      data['display_name'] != loggedInUserName
                          ? InkWell(
                              child: Row(
                                children: [
                                  SizedBox(width: 5),
                                  CircleAvatar(
                                    backgroundImage: data['image_url'] != null
                                        ? NetworkImage(data['image_url'])
                                        : const AssetImage(
                                                'assets/dummy_user.jpg')
                                            as ImageProvider,
                                    maxRadius: 30,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                ReCase(data['display_name'])
                                                    .titleCase,
                                                style: const TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.justify,
                                              ),
                                              Row(
                                                children: [
                                                  for (var i = 0;
                                                      i < r.toInt();
                                                      i++)
                                                    const Icon(Icons.star,
                                                        color: Colors.indigo)
                                                ],
                                              )
                                            ],
                                          ),
                                          Text(
                                            data['email'],
                                            style: const TextStyle(
                                                color: Colors.blueAccent,
                                                fontStyle: FontStyle.italic),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatWithUser(
                                            dateCreated:
                                                Timestamp.fromDate(dateCreated),
                                            userID: document.id,
                                            userImageURL: data['image_url'],
                                            displayName: data['display_name'],
                                            email: data['email'])));
                              },
                            )
                          : const SizedBox(height: 0, width: 0),
                      data['display_name'] != loggedInUserName
                          ? const Divider()
                          : const SizedBox(),
                      const SizedBox(height: 15)
                    ]);
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
