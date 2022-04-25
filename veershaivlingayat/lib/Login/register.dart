import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Login/login.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;
import 'package:veershaivlingayat/utils/models/users.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _form = GlobalKey<FormState>();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String selectedSubCaste = 'Beda';
  String selectedCaste = 'Jangam';

  int IDcounter = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var user = {
    'uid': null,
    'id': 0,
    'age': 0,
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
    // 'match_occupation': null,
    'match_special_characteristics': null,
    'mother_tongue': null,
    'match_height_low': 129,
    'match_height_high': 201,
    'match_age_low': 20,
    'match_age_high': 50,
    'drink': null,
    'smoke': null,
    'spectacles': null,
    'height': 129,
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
    'profile_picture': null,
    'blocked_profiles': [],
    'interest_sent': []
  };
  DateTime selectedDate = DateTime.now();

  void _prepareData(
      String id, CollectionReference coll, UserCredential userCred) async {
    CollectionReference profileIds = firestore.collection('profile-ids');
    await profileIds
        .doc(c.profileIdsDocID)
        .get()
        .then((DocumentSnapshot snapshot) => setState(() {
              IDcounter = snapshot['counter'];
              user['name'] = fullName.text;
              user['height'] = height.text;
              user['contact_phone'] = mobileNumber.text;
              user['contact_email'] = email.text;
              user['birth_date_time'] = selectedDate;
              // user['birth_time'] = TimeOfDay.fromDateTime(selectedDate);
              user['uid'] = id;
              user['id'] = IDcounter;
              user['subcaste'] = selectedSubCaste;
              user['caste'] = selectedCaste;
              user['registered_date'] = DateTime.now();
              user['age'] = DateTime.now().year - selectedDate.year;
            }));

    await profileIds.doc(c.profileIdsDocID).set({'counter': IDcounter + 1});
    await coll.doc(userCred.user!.uid).set(user).then;

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('User created!')));

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const Login()));
  }

  void _submit() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.text.toLowerCase().trim(),
        password: password.text,
      );

      CollectionReference users = firestore.collection("users");

      _prepareData(userCredential.user!.uid, users, userCredential);
    } on FirebaseException catch (e) {
      print('Error registering user!');
      print(e);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register User'),
        backgroundColor: Color(c.appColor),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: Image.asset('assets/banner.jpg'),
              ),
              const SizedBox(height: 2),
              // full name
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Full Name *',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .9,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your full name";
                            }
                            return null;
                          },
                          controller: fullName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            // labelText: 'Full Name',
                            hintText: 'Enter your full name',
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Gender',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 30,
                        child: ListTile(
                          title: const Text('Male'),
                          leading: Radio(
                            value: 'Male',
                            onChanged: (value) {
                              setState(() {
                                user['gender'] = value.toString();
                              });
                            },
                            groupValue: user['gender'],
                          ),
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 30,
                        child: ListTile(
                          title: const Text('Female'),
                          leading: Radio(
                            value: 'Female',
                            onChanged: (value) {
                              setState(() {
                                user['gender'] = value.toString();
                              });
                            },
                            groupValue: user['gender'],
                          ),
                        )),
                  ],
                ),
              ),
              // gender
              SizedBox(height: 2),
              // date picker
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 20),
                child: Row(children: [
                  const Text('Birth Date',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  IconButton(
                      onPressed: () => _selectDate(context),
                      icon: Icon(Icons.calendar_month_outlined),
                      color: Color(c.appColor)),
                  SizedBox(width: 2),
                  Text(
                      selectedDate.toString().substring(0, 10) ==
                              DateTime.now().toString().substring(0, 10)
                          ? '(Select your birth date)'
                          : selectedDate.toString().substring(0, 10),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                ]),
              ),
              // caste dropdown
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Caste *',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    DropdownButton(
                        value: selectedCaste,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCaste = newValue!;
                            selectedSubCaste = selectedCaste == 'Jangam'
                                ? 'Beda'
                                : (selectedCaste == 'Lingayat'
                                    ? 'Aadi-Banajgar'
                                    : 'Lad Wani');
                          });
                        },
                        items: c.casteDropdownItems),
                  ],
                ),
              ),
              // subcaste dropdown
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SubCaste *',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    DropdownButton(
                        value: selectedSubCaste,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSubCaste = newValue!;
                          });
                        },
                        items: selectedCaste == 'Jangam'
                            ? c.subcastesOfJangam
                            : (selectedCaste == 'Lingayat'
                                ? c.subcastesOfLingayat
                                : c.subcastesOfLadWani)),
                  ],
                ),
              ),
              //Height text box
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Height * (in cms)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .9,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a height";
                            }
                            return null;
                          },
                          controller: height,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            // labelText: 'Username',
                            hintText: 'Enter height',
                          ),
                        )),
                  ],
                ),
              ),
              // Marital Status
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Marital Status',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    DropdownButton(
                        value: user['marital_status'].toString(),
                        onChanged: (String? newValue) {
                          setState(() {
                            user['marital_status'] = newValue!;
                          });
                        },
                        items: c.maritalDropdownItems),
                  ],
                ),
              ),
              // mobile Number text box
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mobile No*',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .9,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter mobile number";
                            }
                            return null;
                          },
                          controller: mobileNumber,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            // labelText: 'Mobile No',
                            hintText: 'Enter mobile number',
                          ),
                        )),
                  ],
                ),
              ),
              // email address text box
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email *',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .9,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter email address";
                            }
                            return null;
                          },
                          controller: email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            // labelText: 'Email Address',
                            hintText: 'Enter email address',
                          ),
                        )),
                  ],
                ),
              ),
              // Password
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Password *',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * .9,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              }
                              return null;
                            },
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              // labelText: 'Password',
                              hintText: 'Enter password',
                            ),
                          )),
                    ]),
              ), //Confirm Password
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Confirm Password *',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .9,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            } else if (value != password.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          controller: confirmPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            // labelText: 'Password',
                            hintText: 'Enter password same as above',
                          ),
                        )),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .5,
                  child: FlatButton(
                    onPressed: () {
                      _form.currentState!.validate() ? _submit() : null;
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Color(c.appColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
