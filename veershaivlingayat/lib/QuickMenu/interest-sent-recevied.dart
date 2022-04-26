import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class InterestSentRecevied extends StatefulWidget {
  String pageTitle;
  InterestSentRecevied({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _InterestSentReceviedState createState() => _InterestSentReceviedState();
}

class _InterestSentReceviedState extends State<InterestSentRecevied> {
  String searchKey = '';
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String usersOut = '';
  List<dynamic> iDs = [];

  @override
  void initState() {
    super.initState();
    firestore
        .collection('users')
        .doc(auth.currentUser?.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      setState(() {
        iDs = snapshot['interest_sent'];
        for (int i = 0; i < iDs.length; i++) {
          firestore
              .collection('users')
              .doc(iDs[i])
              .get()
              .then((DocumentSnapshot snapshot) {
            setState(() {
              usersOut = usersOut +
                  '\n -- ' +
                  snapshot['name'] +
                  ' - (Profile ID: ' +
                  snapshot['id'].toString() +
                  ')';
            });
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(currentPage: 'Interest'),
      appBar: AppBar(
        title: const Text('Interest'),
        backgroundColor: Color(c.appColor),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
            child: Flexible(
                child: Text(
              'Users you are interested in',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            child: Flexible(
                child: Text(
              usersOut,
              style: const TextStyle(fontSize: 16),
            )),
          ),
        ],
      )),
    );
  }
}
