import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/homepage.dart';
import 'package:veershaivlingayat/Login/login.dart';
import 'package:veershaivlingayat/Profile/edit_profile.dart';
import 'package:veershaivlingayat/Profile/profile-images.dart';
import 'package:veershaivlingayat/QuickMenu/interest-sent-recevied.dart';
import 'package:veershaivlingayat/QuickMenu/search-profiles.dart';
import 'package:veershaivlingayat/QuickMenu/search-results.dart';
import 'package:veershaivlingayat/QuickMenu/shortlisted-blocked.dart';
import 'package:veershaivlingayat/StaticScreens/about-us.dart';
import 'package:veershaivlingayat/StaticScreens/astrology.dart';
import 'package:veershaivlingayat/StaticScreens/contact-us.dart';
import 'package:veershaivlingayat/StaticScreens/faq.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;
import 'dart:io';

class Profile extends StatefulWidget {
  final Future<DocumentSnapshot<Map<String, dynamic>>> user;
  Map<String, dynamic> searchParameters;
  String searchType;
  final String fromPage;
  final bool isSelf;
  Profile(
      {Key? key,
      required this.user,
      required this.fromPage,
      required this.searchParameters,
      required this.searchType,
      required this.isSelf})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _imageURL = '';
  int _profileID = 0;
  String _name = "";
  String _contactPhone = "";
  String _contactPhoneOther = "";
  String _address = "";
  String _email = "";
  String _city = "";
  String _state = "";
  String _workCity = "";
  String _birthCity = "";
  String _birthState = "";
  String _weight = "";
  String _qualification = "";
  String _matchQualification = "";
  String _info = "";
  String _family = "";
  String _relative = "";
  String _occupation = "";
  String _special = "";
  List<dynamic> photos = [];
  List<dynamic> _imagesURL = [];
  String? userID = '';
  String _downloadUrl = '';
  final File _imageFile = File('');
  String _currentAddress = '';
  String selectedUrgencyValue = "No Hurry";
  String _gender = "Male";
  String selectedMaritalStatusValue = "Never Married";
  String selectedCasteValue = "Jangam";
  String selectedSubCasteValue = "Beda";
  String selectedIntercasteValue = "No";
  String selectedOccupationValue = "Select Occupation>";
  String selectedIncomeValue = "Rs.50,001 - 1,00,000";
  String selectedEducationValue = "Select any one option";
  String selectedMatchEducationValue = "Select any one option";
  String selectedSettlingAbroadValue = "Select any one option";
  String selectedResidencyValue = "Select any one option";
  String selectedCountryValue = "Please select";
  String selectedBirthCountryValue = "Please select";
  String _refOne = "";
  String _refOnePhone = "";
  String _refTwo = "";
  String _refTwoPhone = "";
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedRasiValue = "Mesh";
  String selectedNakshatraValue = "Ashwini";
  String selectedCharanValue = "1";
  String selectedNadiValue = "Adhya";
  String selectedGanValue = "Manushya";
  String selectedManglikValue = "NonManglik";
  String selectedBloodValue = "Not Applicable";
  String selectedBodyValue = "Please select";
  String selectedSpectaclesValue = "No";
  String selectedComplexionValue = "Please select";
  String selectedDietValue = "Please select";
  String selectedSmokeValue = "No";
  String selectedDrinkValue = "No";
  double _currentHeightValue = 129;
  double _heightLowValue = 129;
  double _heightHighValue = 201;
  RangeValues _currentHeightValues = const RangeValues(129, 201);
  double _ageLowValue = 20;
  double _ageHighValue = 50;
  RangeValues _currentAgeValues = const RangeValues(20, 50);
  String selectedPhyValue = "No";
  String selectedTongueValue = "Please select";
  String selectedMatchManglikValue = "NonManglik";
  String selectedOutsideSubcasteValue = "No";
  String selectedOutsideCasteValue = "No";
  String selectedDivorcedValue = "No";
  String selectedMarryIntercasteValue = "No";
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
        widget.user.then((DocumentSnapshot snapshot) {
          if (snapshot['profile_picture'] != null &&
              snapshot['profile_picture'] != '') {
            setState(() {
              _imageURL = snapshot['profile_picture'];
            });
          } else {
            setState(() {
              _imageURL = "";
            });
          }
          setState(() {
            if (snapshot['profile_picture'] != null &&
                snapshot['profile_picture'] != '') {
              _imageURL = snapshot['profile_picture'];
            }
            userID = snapshot['uid'];
            _profileID = snapshot['id'];
            photos = snapshot['photos'];
            _imagesURL = photos;
            _name = snapshot["name"] ?? "";
            selectedUrgencyValue = snapshot["urgency"] == null
                ? (snapshot["urgency"] == "Select any one option"
                    ? ""
                    : snapshot["urgency"])
                : "";
            _gender = snapshot["gender"];
            selectedMaritalStatusValue =
                snapshot["marital_status"] ?? "Never Married";
            selectedCasteValue = snapshot["caste"] ?? "";
            selectedSubCasteValue = snapshot["subcaste"] ?? "";
            selectedIntercasteValue = snapshot['intercaste_parents'] ?? "";
            selectedOccupationValue = snapshot['occupation'] == null
                ? (snapshot["occupation"] == "Select Occupation>"
                    ? ""
                    : snapshot["occupation"])
                : "";
            selectedIncomeValue = snapshot['income'] ?? "";
            selectedEducationValue = snapshot['education_level'] == null
                ? (snapshot["education_level"] == "Select any one option"
                    ? ""
                    : snapshot["education_level"])
                : "";
            _qualification = snapshot['education_qualification'] ?? "";
            selectedSettlingAbroadValue = snapshot['settling_abroad'] == null
                ? (snapshot["settling_abroad"] == "Select any one option"
                    ? ""
                    : snapshot["settling_abroad"])
                : "";
            selectedResidencyValue = snapshot['residency_status'] == null
                ? (snapshot["residency_status"] == "Select any one option"
                    ? ""
                    : snapshot["residency_status"])
                : "";
            _contactPhone = snapshot['contact_phone'] ?? "";
            _contactPhoneOther = snapshot['contact_phone_other'] ?? "";
            _address = snapshot['permanent_address'] ?? "";
            _email = snapshot['contact_email'] ?? "";
            _city = snapshot['contact_city'] ?? "";
            _state = snapshot['contact_state'] ?? "";
            selectedCountryValue = snapshot['contact_country'] == null
                ? (snapshot["contact_country"] == "Please select"
                    ? ""
                    : snapshot["contact_country"])
                : "";
            _workCity = snapshot['work_city'] ?? "";
            photos = snapshot['photos'];
            _refOne = snapshot['reference_one'] ?? "";
            _refOnePhone = snapshot['reference_one_phone'] ?? "";
            _refTwo = snapshot['reference_two'] ?? "";
            _refTwoPhone = snapshot['reference_two_phone'] ?? "";
            selectedDate =
                DateTime.parse(snapshot['birth_date_time'].toDate().toString());
            selectedTime = TimeOfDay.fromDateTime(DateTime.parse(
                snapshot['birth_date_time'].toDate().toString()));
            _birthCity = snapshot['birth_city'] ?? "";
            _birthState = snapshot['birth_state'] ?? "";
            selectedBirthCountryValue = snapshot['birth_country'] == null
                ? (snapshot["birth_country"] == "Please select"
                    ? ""
                    : snapshot["birth_country"])
                : "";
            selectedRasiValue = snapshot['rasi'] == null
                ? (snapshot["rasi"] == "Not Applicable" ? "" : snapshot["rasi"])
                : "";
            selectedNakshatraValue = snapshot['nakshatra'] == null
                ? (snapshot["nakshatra"] == "Not Applicable"
                    ? ""
                    : snapshot["nakshatra"])
                : "";
            selectedCharanValue = snapshot['charan'] == null
                ? (snapshot["charan"] == "Not Applicable"
                    ? ""
                    : snapshot["charan"])
                : "";
            selectedNadiValue = snapshot['nadi'] == null
                ? (snapshot["nadi"] == "Not Applicable" ? "" : snapshot["nadi"])
                : "";
            selectedGanValue = snapshot['gan'] == null
                ? (snapshot["gan"] == "Not Applicable" ? "" : snapshot["gan"])
                : "";
            selectedManglikValue = snapshot['manglik'] == null
                ? (snapshot["manglik"] == "Not Applicable"
                    ? ""
                    : snapshot["manglik"])
                : "";
            selectedBloodValue = snapshot['blood_group'] == null
                ? (snapshot["blood_group"] == "Not Applicable"
                    ? ""
                    : snapshot["blood_group"])
                : "";
            _currentHeightValue = snapshot['height'];
            _weight = snapshot['weight'] ?? "";
            selectedBodyValue = snapshot['body_type'] == null
                ? (snapshot["body_type"] == "Please select"
                    ? ""
                    : snapshot["body_type"])
                : "";
            selectedSpectaclesValue = snapshot['spectacles'] ?? "";
            selectedComplexionValue = snapshot['complexion'] == null
                ? (snapshot["complexion"] == "Please select"
                    ? ""
                    : snapshot["complexion"])
                : "";
            selectedDietValue = snapshot['diet'] == null
                ? (snapshot["diet"] == "Please select" ? "" : snapshot["diet"])
                : "";
            selectedSmokeValue = snapshot['smoke'] ?? "";
            selectedDrinkValue = snapshot['drink'] ?? "";
            selectedPhyValue = snapshot['physically_challenged'] ?? "";
            selectedTongueValue = snapshot['mother_tongue'] == null
                ? (snapshot["mother_tongue"] == "Please select"
                    ? ""
                    : snapshot["mother_tongue"])
                : "";
            _info = snapshot['information'] ?? "";
            _family = snapshot['family_background'] ?? "";
            _relative = snapshot['relative_information'] ?? "";
            _occupation = snapshot['employment_history'] ?? "";
            _heightLowValue = snapshot['match_height_low'];
            _heightHighValue = snapshot['match_height_high'];
            _currentHeightValues =
                RangeValues(_heightLowValue, _heightHighValue);
            _ageLowValue = snapshot['match_age_low'];
            _ageHighValue = snapshot['match_age_high'];
            _currentAgeValues = RangeValues(_ageLowValue, _ageHighValue);
            selectedMatchEducationValue = snapshot['match_education'] == null
                ? (snapshot["match_education"] == "Select any one option"
                    ? ""
                    : snapshot["match_education"])
                : "";
            _matchQualification =
                snapshot['match_education_qualification'] ?? "";
            _special = snapshot['match_special_characteristics'] ?? "";
            selectedMatchManglikValue = snapshot['match_manglik'] == null
                ? (snapshot["match_manglik"] == "Not Applicable"
                    ? ""
                    : snapshot["match_manglik"])
                : "";
            selectedOutsideSubcasteValue =
                snapshot['marry_outside_subcaste'] ?? "";
            selectedOutsideCasteValue = snapshot['marry_outside_caste'] ?? "";
            selectedDivorcedValue = snapshot['marry_divorced'] ?? "";
            selectedMarryIntercasteValue = snapshot['marry_intercaste'] ?? "";
          });
        });
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
              if (widget.fromPage == "Welcome" || widget.fromPage == "edit") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Homepage(
                              pageTitle: 'Welcome',
                            )));
              } else if (widget.fromPage == "searchResults") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SearchResults(
                            searchParameters: widget.searchParameters,
                            searchType: widget.searchType)));
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
            widget.isSelf
                ? IconButton(
                    onPressed: () async {
                      await auth.signOut();
                    },
                    icon: const Icon(Icons.logout),
                    tooltip: "Logout",
                  )
                : const Text(''),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Center(
                child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: (_imageURL == null || _imageURL == '')
                      ? const AssetImage("assets/dummy_user.jpg")
                          as ImageProvider
                      : NetworkImage(_imageURL),
                  backgroundColor: Color(c.appColor),
                  radius: 100,
                ),
                const SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(10.0),
                  child: Flexible(
                    child: Text(_name.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
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
                        child: Text('Profile ID',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(_profileID.toString(),
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
                          children: [
                            Flexible(
                              child: Text(_gender == "Male" ? "M" : "F",
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
                          children: [
                            Flexible(
                              child: Text(selectedUrgencyValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedCasteValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedSubCasteValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedMaritalStatusValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedOccupationValue,
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
                          children: [
                            Flexible(
                              child: Text(_city,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Flexible(
                        child: Text('Occupation Details',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
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
                          children: [
                            Flexible(
                              child: Text(selectedIncomeValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedEducationValue,
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
                          children: [
                            Flexible(
                              child: Text(_qualification,
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
                          children: [
                            Flexible(
                              child: Text(
                                  selectedDate.toString().substring(0, 10),
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
                          children: [
                            Flexible(
                              child: Text(
                                  selectedTime.toString().substring(10, 15),
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
                          children: [
                            Flexible(
                              child: Text(_birthCity,
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
                          children: [
                            Flexible(
                              child: Text(selectedBirthCountryValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedBloodValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedRasiValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedNakshatraValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedCharanValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedNadiValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedManglikValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedPhyValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedBodyValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedComplexionValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedDietValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedSmokeValue,
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
                          children: [
                            Flexible(
                              child: Text(
                                  _currentHeightValue.round().toString() +
                                      " cm",
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
                          children: [
                            Flexible(
                              child: Text(_info,
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
                          children: [
                            Flexible(
                              child: Text(_relative,
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
                          children: [
                            Flexible(
                              child: Text(_family,
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
                          children: [
                            Flexible(
                              child: Text(_occupation,
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
                          children: [
                            Flexible(
                              child: Text(_email,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Mobile Number',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(_contactPhone,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Other Mobile Number',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(_contactPhoneOther,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Contact Address',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(_address,
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
                          children: [
                            Flexible(
                              child: Text(selectedMatchEducationValue,
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
                          children: [
                            Flexible(
                              child: Text(_matchQualification,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text('Match Expected Special Characteristics',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(_special,
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
                          children: [
                            Flexible(
                              child: Text(selectedOutsideCasteValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedOutsideSubcasteValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedMatchManglikValue,
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
                          children: [
                            Flexible(
                              child: Text(selectedDivorcedValue,
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
                TextButton(
                  child: Text('View Gallery'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ProfileImages(
                              pageTitle: 'Profile Images',
                              images: photos,
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
