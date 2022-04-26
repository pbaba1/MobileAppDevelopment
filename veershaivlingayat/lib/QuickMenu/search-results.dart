import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Profile/profile-images.dart';
import 'package:veershaivlingayat/Profile/profile.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class SearchResults extends StatefulWidget {
  Map<String, dynamic> searchParameters;
  String searchType;
  SearchResults(
      {Key? key, required this.searchParameters, required this.searchType})
      : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? user;
  String uid = '';
  String gender = '';
  Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
    // searchProfilesBasedOnSearchParameters();
  }

  void sendInterestBlocked(String key, String element) {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        firestore
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  setState(() {
                    List<dynamic> list = snapshot[key];
                    if (list.contains(element)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Already in list!")));
                    } else {
                      list.add(element);
                      firestore
                          .collection('users')
                          .doc(user.uid)
                          .update({key: list});
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Added in list!")));
                    }
                  })
                });
      }
    });
  }

  fetchUserDetails() {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        firestore
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  setState(() {
                    uid = snapshot['uid'];
                    gender = snapshot['gender'];
                    searchProfilesBasedOnSearchParameters();
                  })
                });
      }
    });
  }

  searchProfilesBasedOnSearchParameters() {
    // if (widget.searchParameters['simple_search']['id'] == '' ||
    //     widget.searchParameters['simple_search']['id'] == null) {}

    switch (widget.searchType) {
      case 'SimpleSearch':
        {
          // if (widget.searchParameters['simple_search']['id'] == '' ||
          //     widget.searchParameters['simple_search']['id'] == null) {
          //   _users = firestore
          //       .collection('users')
          //       .where('id', isGreaterThanOrEqualTo: 1000)
          //       .snapshots();
          // } else {
          //   _users = firestore
          //       .collection('users')
          //       .where('id',
          //           isEqualTo: widget.searchParameters['simple_search']['id'])
          //       .snapshots();

          // }
          _users = firestore
              .collection('users')
              .where('gender', isNotEqualTo: gender)
              .snapshots();
          break;
        }
      case 'AdvancedSearch':
        {
          _users = firestore
              .collection('users')
              .where('gender', isNotEqualTo: gender)
              .snapshots();
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
        backgroundColor: Color(c.appColor),
      ),
      body: SingleChildScrollView(
          child: StreamBuilder(
        stream: _users,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              if (data['gender'] != gender && data['uid'] != uid) {
                if ((data['age'] >=
                        widget.searchParameters['simple_search']['age'] &&
                    data['age'] <=
                        widget.searchParameters['simple_search']['age'])) {
                  if ((data['height'] >=
                          widget.searchParameters['simple_search']['height'] &&
                      data['height'] <=
                          widget.searchParameters['simple_search']['height'])) {
                    if (widget.searchParameters['simple_search']['caste'] !=
                                'Any' &&
                            data['caste'] ==
                                widget.searchParameters['simple_search']
                                    ['caste'] ||
                        widget.searchParameters['simple_search']['subcaste'] !=
                                'Any' &&
                            data['subcaste'] ==
                                widget.searchParameters['simple_search']
                                    ['subcaste'] ||
                        widget.searchParameters['simple_search']['education'] !=
                                'Any' &&
                            data['education'] ==
                                widget.searchParameters['simple_search']
                                    ['education'] ||
                        widget.searchParameters['simple_search']['urgency'] !=
                                'Select any one option' &&
                            data['urgency'] ==
                                widget.searchParameters['simple_search']
                                    ['urgency']) {
                      return Column(children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                        searchParameters:
                                            widget.searchParameters,
                                        searchType: widget.searchType,
                                        user: firestore
                                            .collection('users')
                                            .doc(data['uid'])
                                            .get(),
                                        fromPage: 'searchResults',
                                        isSelf: false)));
                          },
                          child: Row(children: [
                            Text(data['name']),
                            CircleAvatar(
                              backgroundImage: (data['profile_picture'] !=
                                          null ||
                                      data['profile_picture'] == '')
                                  ? NetworkImage(data['profile_picture'])
                                  : const AssetImage('assets/dummy_user.jpg')
                                      as ImageProvider,
                              maxRadius: 30,
                            ),
                          ]),
                        ),
                      ]);
                    } else {
                      return Column(children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                        searchParameters:
                                            widget.searchParameters,
                                        searchType: widget.searchType,
                                        user: firestore
                                            .collection('users')
                                            .doc(data['uid'])
                                            .get(),
                                        fromPage: 'searchResults',
                                        isSelf: false)));
                          },
                          child: Row(children: [
                            Text(data['name']),
                            CircleAvatar(
                              backgroundImage: data['profile_picture'] != null
                                  ? NetworkImage(data['profile_picture'])
                                  : const AssetImage('assets/dummy_user.jpg')
                                      as ImageProvider,
                              maxRadius: 30,
                            ),
                          ]),
                        ),
                      ]);
                    }
                  }
                }
              }
              return Column(children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile(
                                searchParameters: widget.searchParameters,
                                searchType: widget.searchType,
                                user: firestore
                                    .collection('users')
                                    .doc(data['uid'])
                                    .get(),
                                fromPage: 'searchResults',
                                isSelf: false)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Profile(
                                    user: firestore
                                        .collection("users")
                                        .doc(data['uid'])
                                        .get(),
                                    fromPage: 'searchResults',
                                    searchParameters: widget.searchParameters,
                                    searchType: widget.searchType,
                                    isSelf: false)));
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: data['profile_picture'] !=
                                            null
                                        ? NetworkImage(data['profile_picture'])
                                        : const AssetImage(
                                                'assets/dummy_user.jpg')
                                            as ImageProvider,
                                    maxRadius: 50,
                                  ),
                                  SizedBox(height: 5),
                                  Text(data['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  Text(data['age'].toString() + ' years',
                                      style: const TextStyle(fontSize: 16)),
                                  Text(data['occupation'],
                                      style: const TextStyle(fontSize: 16)),
                                  Text(data['work_city'],
                                      style: const TextStyle(fontSize: 16)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.send),
                                        iconSize: 25,
                                        color: Colors.green,
                                        onPressed: () {
                                          sendInterestBlocked(
                                              'interest_sent', data['uid']);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.block),
                                        iconSize: 25,
                                        color: Colors.red,
                                        onPressed: () {
                                          sendInterestBlocked(
                                              'blocked_profiles', data['uid']);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            elevation: 8,
                          ),
                        ),
                      )
                      // CircleAvatar(
                      //   backgroundImage: data['profile_picture'] != null
                      //       ? NetworkImage(data['profile_picture'])
                      //       : const AssetImage('assets/dummy_user.jpg')
                      //           as ImageProvider,
                      //   maxRadius: 30,
                      // ),
                      // Text(data['name']),
                    ]),
                  ),
                ),
              ]);
            }).toList(),
          );
        },
      )),
    );
  }
}
