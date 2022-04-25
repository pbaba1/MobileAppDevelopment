import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  void initState() {
    super.initState();

    searchProfilesBasedOnSearchParameters();
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
                  })
                });
      }
    });
  }

  searchProfilesBasedOnSearchParameters() {
    print(widget.searchParameters['simple_search']['id']);
    switch (widget.searchType) {
      case 'SimpleSearch':
        {
          _users = firestore
              .collection('users')
              .where('id',
                  isGreaterThanOrEqualTo:
                      widget.searchParameters['simple_search']['id'])
              .snapshots();

          break;
        }
      case 'AdvancedSearch':
        {
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
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Column(
                  children: [/* data['uid']!=uid? */ Text(data['name'])]);
            }).toList(),
          );
        },
      )),
    );
  }
}
