import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDirectory extends StatefulWidget {
  const UserDirectory({Key? key}) : super(key: key);

  @override
  _UserDirectoryState createState() => _UserDirectoryState();
}

class _UserDirectoryState extends State<UserDirectory> {
  Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('users').snapshots();
  String searchKey = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatApp'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchKey = value;
                      _users = FirebaseFirestore.instance
                          .collection('users')
                          .where('fname', isGreaterThanOrEqualTo: searchKey)
                          .where('fname', isLessThan: searchKey + '\uf7ff')
                          .snapshots();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search conversations",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade100)),
                  ),
                ),
              ),
            ),
            // LIST OF CONTACTS
            SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
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
                    return const Text('No users present',
                        style: TextStyle(fontSize: 18, color: Colors.indigo));
                  }
                  return SingleChildScrollView(
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;

                        return SingleChildScrollView(
                          child: Column(children: [
                            Row(
                              children: [
                                // Text(data['fname'])
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width * 1,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.red),
                                  child: Text(
                                    data['fname'] + ' ' + data['lname'],
                                    style: const TextStyle(
                                        color: Colors.blueAccent),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15)
                          ]),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
