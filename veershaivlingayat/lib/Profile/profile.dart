import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/homepage.dart';
import 'package:veershaivlingayat/Login/login.dart';
import 'package:veershaivlingayat/Profile/edit_profile.dart';
import 'package:veershaivlingayat/Profile/profile-images.dart';
import 'package:veershaivlingayat/QuickMenu/gunmilan.dart';
import 'package:veershaivlingayat/QuickMenu/interest-sent-recevied.dart';
import 'package:veershaivlingayat/QuickMenu/melawa-information.dart';
import 'package:veershaivlingayat/QuickMenu/search-profiles.dart';
import 'package:veershaivlingayat/QuickMenu/shortlisted-blocked.dart';
import 'package:veershaivlingayat/StaticScreens/about-us.dart';
import 'package:veershaivlingayat/StaticScreens/astrology.dart';
import 'package:veershaivlingayat/StaticScreens/contact-us.dart';
import 'package:veershaivlingayat/StaticScreens/faq.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class Profile extends StatefulWidget {
  // final Future<DocumentSnapshot<Map<String, dynamic>>> user;
  final String fromPage;
  final bool isSelf;
  const Profile(
      {Key? key,
      // required this.user,
      required this.fromPage,
      required this.isSelf})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _imageURL = "Null";
  String _name = "Pooja Basavraj Baba";
  String _email = "";
  String _profileID = "";
  bool _rated = false;
  String _currentAddress = '';
  User? user;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  void _fetchUserDetails() {
    auth.authStateChanges().listen((User? u) {
      user = u;
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
            (Route route) => false);
      } else {
        firestore
            .collection('users')
            .doc(user?.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {setState(() {})});
      }
    });
  }

  // _update(value) {
  //   widget.user.then((DocumentSnapshot snapshot) {
  //     firestore.collection("users").doc(snapshot['uid']).set({
  //       'uid': snapshot['uid'],
  //       'displayName': snapshot['displayName'],
  //       'email': snapshot['email'],
  //       'imageURL': snapshot['imageURL'],
  //       "createdAt": snapshot['createdAt'],
  //       "displayNameLower": snapshot['displayNameLower'],
  //       "motto": snapshot['motto']
  //     });
  //   });
  // }

  // Widget _logout(context) {
  //   return AlertDialog(
  //     title: const Text("Logout"),
  //     content: const Text("Confirm Logout?"),
  //     actions: [
  //       FlatButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text("No"),
  //           color: Colors.red.shade700,
  //           textColor: Colors.white,
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(32.0))),
  //       FlatButton(
  //           onPressed: () async {
  //             await Provider.of<GoogleSignInClass>(context, listen: false)
  //                 .logout();
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => const Login()),
  //                 (Route route) => false);
  //           },
  //           child: const Text("Yes"),
  //           color: Colors.red.shade700,
  //           textColor: Colors.white,
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(32.0))),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (widget.fromPage == "home" || widget.fromPage == "edit") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Homepage(
                              pageTitle: 'Welcome',
                            )));
              } else if (widget.fromPage == "Search Profiles") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            SearchProfiles(pageTitle: widget.fromPage)));
              } else if (widget.fromPage == "About Us") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AboutUs(pageTitle: widget.fromPage)));
              } else if (widget.fromPage == "Contact Us") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ContactUs(pageTitle: widget.fromPage)));
              } else if (widget.fromPage == "FAQ") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FAQ(pageTitle: widget.fromPage)));
              } else if (widget.fromPage == "Astrology") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Astrology(pageTitle: widget.fromPage)));
              } else if (widget.fromPage == "Interest Sent") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            InterestSentRecevied(pageTitle: widget.fromPage)));
              } else if (widget.fromPage == "Blocked") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ShortlistedBlocked(pageTitle: widget.fromPage)));
              } else if (widget.fromPage == "Melawa Information") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            MelawaInformation(pageTitle: widget.fromPage)));
              } else if (widget.fromPage == "Gunmilan") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Gunmilan(pageTitle: widget.fromPage)));
              }
            },
          ),
          title: const Text("Profile Information"),
          centerTitle: true,
          backgroundColor: Color(c.appColor),
          actions: [
            widget.isSelf
                ? IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfile()));
                      // print("Edit Profile");
                    },
                    icon: const Icon(Icons.edit),
                    tooltip: "Edit Profile",
                  )
                : const Text(""),
            IconButton(
              onPressed: () async {
                await auth.signOut();
              },
              icon: const Icon(Icons.logout),
              tooltip: "Logout",
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Center(
                child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: _imageURL == "Null"
                      ? const AssetImage("assets/dummy_user.jpg")
                          as ImageProvider
                      : NetworkImage(_imageURL),
                  radius: 100,
                ),
                const SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(10.0),
                  child: Flexible(
                    child: Text(_name + " " + _profileID,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(4.0)),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Name',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(_name,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Gender',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('F',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Urgency',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Within 2 years',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Caste',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Lingayat',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Subcaste',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Koshti',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Marital Status',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Never Married',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Occupation',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Software Professional',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Contact City',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Pune',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Occupation Details',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Annual Income',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('NA',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Education Level',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Bachelors',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Educational Qualifications',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text(
                                  'Bachelors in Computer - MIT, Pune (Savitribai Phule Pune University)',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Birth Date',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('06/12/1995',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Birth Time',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('9:28:PM',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Birth City',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Solapur',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Birth Country',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('India',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Blood Group',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('B+',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Rashi',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Vrushabh',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Nakshatra',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Rohini',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Charan',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('2',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Nadi',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Antya',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Manglik Status',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('NonManglik',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Physical',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('none',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Body Type',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Average',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Complexion',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Fair',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Diet',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Vegitarian',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Smoke',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('No',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Height',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('5\' 7" (169 cm)',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Other personal Information',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text(
                                  'I belong to a nuclear family residing in Pune. I am a technology enthusiast and enjoy hiking, reading and cooking. I have issued B1/B2 visa (U.S.A) in the year 2019 valid through 2029.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Relative Information',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text(
                                  'Mama: Suresh Shivayogi Jujagar (State government service) Other relatives: Jujagar (Solapur, Maindargi), Patil (Maindargi), Sindagi (Solapur), Mhetre (Solapur - Angar)',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Family Information',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text(
                                  'Father: Basavraj Shivasharan Baba (Retired) Mother: Sridevi Basavraj Baba (Housewife) Sibling(s): None',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Employment History',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text(
                                  'Firm: ZS Associates Pvt. Ltd., Pune (since 2018). Position: Business Technology Solutions Associate Consultant (Promoted in Dec-2020).',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Contact Email',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('babapooja6@gmail.com',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Match Expected Education',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Masters',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Match Expected Qualification',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Match Expected Occupation',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text(
                                  'Computer Engineer,Engineer,IT/Telecommunications,Software Professional',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Match Expected Special Characters',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Ready to Marry Outside Caste?',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('No',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Ready to Marry Outside SubCaste?',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('Yes',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Match\'s Manglik Status',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('NonManglik',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Ready to Marry Divorced?',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            Flexible(
                              child: Text('No',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  child: Text('View Gallery'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProfileImages(
                              pageTitle: 'Profile Images',
                              images: const [
                                'https://firebasestorage.googleapis.com/v0/b/veershaiv-lingayat.appspot.com/o/AIRw3gdq7o4iFEnUuyRq%2Fprofile%20image.jpg?alt=media&token=ea4c19a0-0f94-496b-bd32-c965e5ff5c75',
                                'https://firebasestorage.googleapis.com/v0/b/veershaiv-lingayat.appspot.com/o/AIRw3gdq7o4iFEnUuyRq%2FIMG_20220113_095444.jpg?alt=media&token=1a5069aa-a4c0-438e-85f7-fdef689c7943',
                                'https://firebasestorage.googleapis.com/v0/b/veershaiv-lingayat.appspot.com/o/AIRw3gdq7o4iFEnUuyRq%2FIMG-20211221-WA0012.jpg?alt=media&token=b43d9b4a-4e08-4dac-a555-7534469343cc'
                              ],
                              viewMode: c.READMODE,
                            )));
                  },
                )
              ],
            )),
          ),
        ));
  }
}
