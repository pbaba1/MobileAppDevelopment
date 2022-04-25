import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/Profile/edit_profile.dart';
import 'package:veershaivlingayat/Profile/profile.dart';
import 'package:veershaivlingayat/QuickMenu/interest-sent-recevied.dart';
import 'package:veershaivlingayat/QuickMenu/melawa-information.dart';
import 'package:veershaivlingayat/QuickMenu/search-profiles.dart';
import 'package:veershaivlingayat/QuickMenu/shortlisted-blocked.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  String pageTitle;
  Homepage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _imageURL = "Null";

  String userName = '';
  DateTime expirationDate = DateTime.now();
  String lastVisitedTimestamp = '';
  int profileID = 0;
  int interestSentCount = -99;
  int blockedProfiles = -99;
  int profileCompletenessPercent = 0;
  Map<String, dynamic> user = {
    'uid': null,
    'profile_picture': null,
    'id': 0,
    'name': null,
    'birth_city': null,
    'birth_country': null,
    'birth_state': null,
    'birth_date_time': DateTime.now(),
    'blood_group': null,
    'body_type': null,
    'caste': 'Jangam',
    'charan': null,
    'complexion': null,
    'diet': null,
    'education_level': null,
    'education_qualification': null,
    'employment_history': null,
    'gender': 'Male',
    'income': null,
    'intercaste_parents': null,
    'last_visited_timestamp': null,
    'contact_city': null,
    'contact_country': null,
    'contact_email': null,
    'contact_phone': null,
    'contact_phone_other': null,
    'contact_state': null,
    'information': null,
    'permanent_address': null,
    'physically_challenged': null,
    'marry_divorced': null,
    'marry_intercaste': null,
    'marry_outside_caste': null,
    'marry_outside_subcaste': null,
    'match_education': null,
    'match_education_qualification': null,
    'match_manglik': null,
    'match_special_characteristics': null,
    'mother_tongue': null,
    'match_height_low': null,
    'match_height_high': null,
    'match_age_low': null,
    'match_age_high': null,
    'drink': null,
    'smoke': null,
    'spectacles': null,
    'height': null,
    'weight': null,
    'manglik': null,
    'marital_status': 'Never Married',
    'gan': null,
    'nakshatra': null,
    'nadi': null,
    'occupation': null,
    'photos': [],
    'rasi': null,
    'registered_date': null,
    'relative_information': null,
    'family_background': null,
    'reference_one': null,
    'reference_one_phone': null,
    'reference_two': null,
    'reference_two_phone': null,
    'residency_status': null,
    'subcaste': 'Beda',
    'settling_abroad': null,
    'urgency': null,
    'work_city': null,
    'blocked_profiles': [],
    'interest_sent': []
  };

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  _fetchUserDetails() {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        firestore
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  setState(() {
                    userName = snapshot['name'];
                    var tempDate = DateTime.parse(
                        snapshot['registered_date'].toDate().toString());
                    expirationDate = DateTime(
                        tempDate.year + 1, tempDate.month, tempDate.day - 1);
                    tempDate = DateTime.parse(
                        snapshot['last_visited_timestamp'].toDate().toString());
                    lastVisitedTimestamp =
                        DateFormat('yyyy-MM-dd HH:mm:ss').format(tempDate);
                    profileID = snapshot['id'];
                    interestSentCount = snapshot['interest_sent'].length;
                    blockedProfiles = snapshot['blocked_profiles'].length;
                    calculateProfileCompleteness(snapshot);
                  })
                });
      }
    });
  }

  calculateProfileCompleteness(DocumentSnapshot snapshot) {

    var list = user.values.toList();
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navdrawer(currentPage: 'Home'),
        appBar: AppBar(
          title: Text(widget.pageTitle),
          backgroundColor: Color(c.appColor),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(
                                user: firestore
                                    .collection("users")
                                    .doc(auth.currentUser?.uid)
                                    .get(),
                                fromPage: widget.pageTitle,
                                isSelf: true,
                              )));
                },
                padding: const EdgeInsets.only(left: 20.0),
                child: CircleAvatar(
                  backgroundImage: _imageURL == "Null"
                      ? const AssetImage("assets/dummy_user.jpg")
                          as ImageProvider
                      : NetworkImage(_imageURL),
                ))
          ],
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: Flexible(
                      child: Text('Hi, $userName (ID: $profileID)',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text('Your last visit',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(lastVisitedTimestamp.toString(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 14.0, color: Colors.black)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text('Expires on',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                    expirationDate.toString().substring(0, 10),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 14.0, color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text('Profile Completeness',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                    profileCompletenessPercent.toString(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 14.0, color: Colors.black)),
                              ),
                              Flexible(
                                  child: IconButton(
                                icon: const Icon(
                                    Icons.arrow_circle_right_outlined),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const EditProfile()));
                                },
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.9,
                  //   padding: const EdgeInsets.all(10.0),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(
                  //           color: Colors.black,
                  //           width: 1.0,
                  //           style: BorderStyle.solid)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       const Flexible(
                  //         child: Text('Credit Remaining',
                  //             textAlign: TextAlign.start,
                  //             style: TextStyle(
                  //                 fontSize: 14.0, color: Colors.black)),
                  //       ),
                  //       Flexible(
                  //         child: Row(
                  //           children: const [
                  //             Flexible(
                  //               child: Text('Rs. 0 / -',
                  //                   textAlign: TextAlign.start,
                  //                   style: TextStyle(
                  //                       fontSize: 14.0, color: Colors.black)),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => InterestSentRecevied(
                                  pageTitle: "Interest Sent",
                                ))),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            child: Text('Interest Sent',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black)),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(interestSentCount.toString(),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 14.0, color: Colors.black)),
                                ),
                                const Flexible(
                                    child: Icon(
                                        Icons.arrow_circle_right_outlined)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                ShortlistedBlocked(pageTitle: 'Blocked'))),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            child: Text('Blocked Profiles',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black)),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(blockedProfiles.toString(),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 14.0, color: Colors.black)),
                                ),
                                const Flexible(
                                    child: Icon(
                                        Icons.arrow_circle_right_outlined)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SearchProfiles(
                                  pageTitle: "Search Profiles",
                                ))),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Flexible(
                            child: Text('Search Profiles',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Flexible(
                              child: Icon(Icons.arrow_circle_right_outlined)),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MelawaInformation(
                                  pageTitle: "Melawa Information",
                                ))),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Flexible(
                            child: Text('Melawa Information',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Flexible(
                              child: Icon(Icons.arrow_circle_right_outlined)),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
