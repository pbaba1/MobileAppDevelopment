import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/Profile/edit_profile.dart';
import 'package:veershaivlingayat/Profile/profile.dart';
import 'package:veershaivlingayat/QuickMenu/interest-sent-recevied.dart';
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
  String _imageURL = '';

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
                    if (snapshot['profile_picture'] != null &&
                        snapshot['profile_picture'] != '') {
                      _imageURL = snapshot['profile_picture'];
                    }
                    calculateProfileCompleteness(snapshot);
                  })
                });
      }
    });
  }

  calculateProfileCompleteness(DocumentSnapshot snapshot) {
    setState(() {
      user['uid'] = snapshot['uid'];
      user['photos'] = snapshot['photos'];
      user['name'] = snapshot["name"];
      user['urgency'] = snapshot["urgency"];
      user['gender'] = snapshot["gender"];
      user['marital_status'] = snapshot["marital_status"];
      user['caste'] = snapshot["caste"];
      user['subcaste'] = snapshot["subcaste"];
      user['intercaste_parents'] = snapshot['intercaste_parents'];
      user['occupation'] = snapshot['occupation'];
      user['income'] = snapshot['income'];
      user['education_level'] = snapshot['education_level'];
      user['education_qualification'] = snapshot['education_qualification'];
      user['settling_abroad'] = snapshot['settling_abroad'];
      user['residency_status'] = snapshot['residency_status'];
      user['contact_phone'] = snapshot['contact_phone'];
      user['contact_phone_other'] = snapshot['contact_phone_other'];
      user['permanent_address'] = snapshot['permanent_address'];
      user['contact_email'] = snapshot['contact_email'];
      user['contact_city'] = snapshot['contact_city'];
      user['contact_state'] = snapshot['contact_state'];
      user['contact_country'] = snapshot['contact_country'];
      user['work_city'] = snapshot['work_city'];
      user['reference_one'] = snapshot['reference_one'];
      user['reference_one_phone'] = snapshot['reference_one_phone'];
      user['reference_two'] = snapshot['reference_two'];
      user['reference_two_phone'] = snapshot['reference_two_phone'];
      user['birth_date_time'] = snapshot['birth_date_time'];
      user['birth_city'] = snapshot['birth_city'];
      user['birth_state'] = snapshot['birth_state'];
      user['birth_country'] = snapshot['birth_country'];
      user['rasi'] = snapshot['rasi'];
      user['nakshatra'] = snapshot['nakshatra'];
      user['charan'] = snapshot['charan'];
      user['nadi'] = snapshot['nadi'];
      user['gan'] = snapshot['gan'];
      user['manglik'] = snapshot['manglik'];
      user['blood_group'] = snapshot['blood_group'];
      user['height'] = snapshot['height'];
      user['weight'] = snapshot['weight'];
      user['body_type'] = snapshot['body_type'];
      user['spectacles'] = snapshot['spectacles'];
      user['complexion'] = snapshot['complexion'];
      user['diet'] = snapshot['diet'];
      user['smoke'] = snapshot['smoke'];
      user['drink'] = snapshot['drink'];
      user['physically_challenged'] = snapshot['physically_challenged'];
      user['mother_tongue'] = snapshot['mother_tongue'];
      user['information'] = snapshot['information'];
      user['family_background'] = snapshot['family_background'];
      user['relative_information'] = snapshot['relative_information'];
      user['employment_history'] = snapshot['employment_history'];
      user['match_height_low'] = snapshot['match_height_low'];
      user['match_height_high'] = snapshot['match_height_high'];
      user['match_age_low'] = snapshot['match_age_low'];
      user['match_age_high'] = snapshot['match_age_high'];
      user['match_education'] = snapshot['match_education'];
      user['match_education_qualification'] =
          snapshot['match_education_qualification'];

      user['match_special_characteristics'] =
          snapshot['match_special_characteristics'];
      user['match_manglik'] = snapshot['match_manglik'];
      user['marry_outside_subcaste'] = snapshot['marry_outside_subcaste'];
      user['marry_outside_caste'] = snapshot['marry_outside_caste'];
      user['marry_divorced'] = snapshot['marry_divorced'];
      user['marry_intercaste'] = snapshot['marry_intercaste'];
    });
    var toCount = user.values.toList().where((letter) => (letter == '' ||
        letter == null ||
        letter == 'Please Select' ||
        letter == 'Select any one option'));
    int finalCount = toCount.length;

    if (user['photos'].length != 6) {
      finalCount += 1;
    }
    setState(() {
      profileCompletenessPercent =
          100 - ((finalCount / user.values.toList().length) * 100).round();
    });
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
                                searchParameters: {},
                                searchType: '',
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
                  backgroundImage: (_imageURL == '' || _imageURL == null)
                      ? const AssetImage("assets/dummy_user.jpg")
                          as ImageProvider
                      : NetworkImage(_imageURL),
                  backgroundColor: Color(c.appColor),
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
                                    profileCompletenessPercent.toString() +
                                        ' %',
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
                ],
              )),
        ));
  }
}
