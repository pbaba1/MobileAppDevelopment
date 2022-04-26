import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veershaivlingayat/Login/login.dart';
import 'package:veershaivlingayat/Profile/profile-images.dart';
import 'package:veershaivlingayat/Profile/profile.dart';
import 'dart:io';
import 'package:veershaivlingayat/utils/constants.dart' as c;
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _form = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _imageURL = "";
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
  File _imageFile = File('');
  final TextEditingController _displayname = TextEditingController();
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _cityCont = TextEditingController();
  final TextEditingController _stateCont = TextEditingController();
  final TextEditingController _workCityCont = TextEditingController();
  final TextEditingController _birthCityCont = TextEditingController();
  final TextEditingController _birthStateCont = TextEditingController();
  final TextEditingController _weightCont = TextEditingController();
  final TextEditingController _qualificationCont = TextEditingController();
  final TextEditingController _matchQualificationCont = TextEditingController();
  final TextEditingController _contactPhoneCont = TextEditingController();
  final TextEditingController _contactPhoneContOther = TextEditingController();
  final TextEditingController _infoCont = TextEditingController();
  final TextEditingController _familyCont = TextEditingController();
  final TextEditingController _relativeCont = TextEditingController();
  final TextEditingController _occupationCont = TextEditingController();
  final TextEditingController _addressCont = TextEditingController();
  final TextEditingController _refOneCont = TextEditingController();
  final TextEditingController _refOnePhoneCont = TextEditingController();
  final TextEditingController _refTwoCont = TextEditingController();
  final TextEditingController _refTwoPhoneCont = TextEditingController();
  final TextEditingController _specialCont = TextEditingController();
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
    print('INSIDE EDIT');
    super.initState();
    _fetchUserDetails();
  }

  _submit() async {
    await firestore
        .collection("users")
        .doc(auth.currentUser?.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      firestore.collection("users").doc(snapshot['uid']).set({
        'uid': snapshot['uid'],
        'age': DateTime.now().year - selectedDate.year,
        'id': snapshot['id'],
        'name': _displayname.text,
        'birth_city': _birthCityCont.text,
        'birth_country': selectedBirthCountryValue,
        'birth_state': _birthStateCont.text,
        'birth_date_time': selectedDate,
        'blood_group': selectedBloodValue,
        'body_type': selectedBodyValue,
        'caste': selectedCasteValue,
        'charan': selectedCharanValue,
        'complexion': selectedComplexionValue,
        'diet': selectedDietValue,
        'education_level': selectedEducationValue,
        'education_qualification': _qualificationCont.text,
        'employment_history': _occupationCont.text,
        'gender': snapshot['gender'],
        'income': selectedIncomeValue,
        'intercaste_parents': selectedIntercasteValue,
        'last_visited_timestamp': snapshot['last_visited_timestamp'],
        'contact_city': _cityCont.text,
        'contact_country': selectedCountryValue,
        'contact_email': snapshot['contact_email'],
        'contact_phone': snapshot['contact_phone'],
        'contact_phone_other': _contactPhoneContOther.text,
        'contact_state': _stateCont.text,
        'information': _infoCont.text,
        'permanent_address': _addressCont.text,
        'physically_challenged': selectedPhyValue,
        'marry_divorced': selectedDivorcedValue,
        'marry_intercaste': selectedMarryIntercasteValue,
        'marry_outside_caste': selectedOutsideCasteValue,
        'marry_outside_subcaste': selectedOutsideSubcasteValue,
        'match_education': selectedMatchEducationValue,
        'match_education_qualification': _matchQualificationCont.text,
        'match_manglik': selectedMatchManglikValue,
        'match_special_characteristics': _specialCont.text,
        'mother_tongue': selectedTongueValue,
        'match_height_low': _heightLowValue,
        'match_height_high': _heightHighValue,
        'match_age_low': _ageLowValue,
        'match_age_high': _ageHighValue,
        'drink': selectedDrinkValue,
        'smoke': selectedSmokeValue,
        'spectacles': selectedSpectaclesValue,
        'height': _currentHeightValue,
        'weight': _weightCont.text,
        'manglik': selectedManglikValue,
        'marital_status': selectedMaritalStatusValue,
        'gan': selectedGanValue,
        'nakshatra': selectedNakshatraValue,
        'nadi': selectedNadiValue,
        'occupation': selectedOccupationValue,
        'photos': _imagesURL,
        'rasi': selectedRasiValue,
        'registered_date': snapshot['registered_date'],
        'relative_information': _relativeCont.text,
        'family_background': _familyCont.text,
        'reference_one': _refOneCont.text,
        'reference_one_phone': _refOnePhoneCont.text,
        'reference_two': _refTwoCont.text,
        'reference_two_phone': _refTwoPhoneCont.text,
        'residency_status': selectedResidencyValue,
        'subcaste': selectedSubCasteValue,
        'settling_abroad': selectedSettlingAbroadValue,
        'urgency': selectedUrgencyValue,
        'work_city': _workCityCont.text,
        'blocked_profiles': snapshot['blocked_profiles'],
        'interest_sent': snapshot['interest_sent'],
        'profile_picture': _imageURL,
      });
    });
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
                  fromPage: "edit",
                  // fromHome: false,
                  isSelf: true,
                )));
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
            .collection("users")
            .doc(auth.currentUser?.uid)
            .get()
            .then((DocumentSnapshot snapshot) {
          if (snapshot['profile_picture'] != null &&
              snapshot['profile_picture'] != '') {
            setState(() {
              _imageURL = snapshot['profile_picture'];
            });
          } else if (!snapshot['photos']
              .contains(snapshot['profile_picture'])) {
            firestore
                .collection('users')
                .doc(auth.currentUser?.uid)
                .update({'profile_picture': ''});
          } else {
            setState(() {
              _imageURL = "";
            });
          }
          setState(() {
            userID = snapshot['uid'];
            photos = snapshot['photos'];
            _imagesURL = photos;
            _name = snapshot["name"] ?? "";
            _displayname.text = snapshot["name"] ?? "";
            selectedUrgencyValue =
                snapshot["urgency"] ?? "Select any one option";
            _gender = snapshot["gender"] ?? "Male";
            selectedMaritalStatusValue =
                snapshot["marital_status"] ?? "Never Married";
            selectedCasteValue = snapshot["caste"] ?? "Jangam";
            selectedSubCasteValue = snapshot["subcaste"] ?? "Beda";
            selectedIntercasteValue = snapshot['intercaste_parents'] ?? "No";
            selectedOccupationValue =
                snapshot['occupation'] ?? "Select Occupation>";
            selectedIncomeValue = snapshot['income'] ?? "Not Applicable";
            selectedEducationValue =
                snapshot['education_level'] ?? "Select any one option";
            _qualification = snapshot['education_qualification'] ?? "";
            _qualificationCont.text = snapshot['education_qualification'] ?? "";
            selectedSettlingAbroadValue =
                snapshot['settling_abroad'] ?? "Select any one option";
            selectedResidencyValue =
                snapshot['residency_status'] ?? "Select any one option";
            _contactPhone = snapshot['contact_phone'] ?? "";
            _contactPhoneCont.text = snapshot['contact_phone'] ?? "";
            _contactPhoneOther = snapshot['contact_phone_other'] ?? "";
            _contactPhoneContOther.text = snapshot['contact_phone_other'] ?? "";
            _address = snapshot['permanent_address'] ?? "";
            _addressCont.text = snapshot['permanent_address'] ?? "";
            _email = snapshot['contact_email'] ?? "";
            _emailCont.text = snapshot['contact_email'] ?? "";
            _city = snapshot['contact_city'] ?? "";
            _cityCont.text = snapshot['contact_city'] ?? "";
            _state = snapshot['contact_state'] ?? "";
            _stateCont.text = snapshot['contact_state'] ?? "";
            selectedCountryValue =
                snapshot['contact_country'] ?? "Please select";
            _workCity = snapshot['work_city'] ?? "";
            _workCityCont.text = snapshot['work_city'] ?? "";
            _refOne = snapshot['reference_one'] ?? "";
            _refOneCont.text = snapshot['reference_one'] ?? "";
            _refOnePhone = snapshot['reference_one_phone'] ?? "";
            _refOnePhoneCont.text = snapshot['reference_one_phone'] ?? "";
            _refTwo = snapshot['reference_two'] ?? "";
            _refTwoCont.text = snapshot['reference_two'] ?? "";
            _refTwoPhone = snapshot['reference_two_phone'] ?? "";
            _refTwoPhoneCont.text = snapshot['reference_two_phone'] ?? "";
            selectedDate =
                DateTime.parse(snapshot['birth_date_time'].toDate().toString());
            selectedTime = TimeOfDay.fromDateTime(DateTime.parse(
                snapshot['birth_date_time'].toDate().toString()));
            _birthCity = snapshot['birth_city'] ?? "";
            _birthCityCont.text = snapshot['birth_city'] ?? "";
            _birthState = snapshot['birth_state'] ?? "";
            _birthStateCont.text = snapshot['birth_state'] ?? "";
            selectedBirthCountryValue =
                snapshot['birth_country'] ?? "Please select";
            selectedRasiValue = snapshot['rasi'] ?? "Not Applicable";
            selectedNakshatraValue = snapshot['nakshatra'] ?? "Not Applicable";
            selectedCharanValue = snapshot['charan'] ?? "Not Applicable";
            selectedNadiValue = snapshot['nadi'] ?? "Not Applicable";
            selectedGanValue = snapshot['gan'] ?? "Not Applicable";
            selectedManglikValue = snapshot['manglik'] ?? "Not Applicable";
            selectedBloodValue = snapshot['blood_group'] ?? "Not Applicable";
            _currentHeightValue = snapshot['height'] ?? 129;
            _weight = snapshot['weight'] ?? "";
            _weightCont.text = snapshot['weight'] ?? "";
            selectedBodyValue = snapshot['body_type'] ?? "Please select";
            selectedSpectaclesValue = snapshot['spectacles'] ?? "No";
            selectedComplexionValue = snapshot['complexion'] ?? "Please select";
            selectedDietValue = snapshot['diet'] ?? "Please select";
            selectedSmokeValue = snapshot['smoke'] ?? "No";
            selectedDrinkValue = snapshot['drink'] ?? "No";
            selectedPhyValue = snapshot['physically_challenged'] ?? "No";
            selectedTongueValue = snapshot['mother_tongue'] ?? "Please select";
            _info = snapshot['information'] ?? "";
            _infoCont.text = snapshot['information'] ?? "";
            _family = snapshot['family_background'] ?? "";
            _familyCont.text = snapshot['family_background'] ?? "";
            _relative = snapshot['relative_information'] ?? "";
            _relativeCont.text = snapshot['relative_information'] ?? "";
            _occupation = snapshot['employment_history'] ?? "";
            _occupationCont.text = snapshot['employment_history'] ?? "";
            _heightLowValue = snapshot['match_height_low'] ?? 129;
            _heightHighValue = snapshot['match_height_high'] ?? 201;
            _currentHeightValues =
                RangeValues(_heightLowValue, _heightHighValue);
            _ageLowValue = snapshot['match_age_low'] ?? 20;
            _ageHighValue = snapshot['match_age_high'] ?? 50;
            _currentAgeValues = RangeValues(_ageLowValue, _ageHighValue);
            selectedMatchEducationValue =
                snapshot['match_education'] ?? "Select any one option";
            _matchQualification =
                snapshot['match_education_qualification'] ?? "";
            _matchQualificationCont.text =
                snapshot['match_education_qualification'] ?? "";
            _special = snapshot['match_special_characteristics'] ?? "";
            _specialCont.text = snapshot['match_special_characteristics'] ?? "";
            selectedMatchManglikValue =
                snapshot['match_manglik'] ?? "Not Applicable";
            selectedOutsideSubcasteValue =
                snapshot['marry_outside_subcaste'] ?? "No";
            selectedOutsideCasteValue = snapshot['marry_outside_caste'] ?? "No";
            selectedDivorcedValue = snapshot['marry_divorced'] ?? "No";
            selectedMarryIntercasteValue = snapshot['marry_intercaste'] ?? "No";
          });
        });
      }
    });
  }

  _update() async {
    await firestore
        .collection("users")
        .doc(auth.currentUser?.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      firestore
          .collection("users")
          .doc(snapshot['uid'])
          .update({'photos': _imagesURL});
      _fetchUserDetails();
    });
  }

  Future _uploadToFirebase(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Uploading the picture....")));
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref =
        storage.ref().child(userID! + '/' + DateTime.now().toString());
    try {
      UploadTask uploadTask = ref.putFile(_imageFile);
      uploadTask.then((res) {
        res.ref.getDownloadURL();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Picture uploaded!")));
      });

      _downloadUrl = await (await uploadTask).ref.getDownloadURL();
      setState(() {
        if (_imagesURL.length == 6) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "You can upload only 6 images. Please view gallery in case you want to update the images.")));
        } else {
          _imagesURL.add(_downloadUrl);
        }
        _update();
      });
    } catch (e) {
      print(e);
    }
  }

  _imgFromCamera(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });

    Navigator.of(context).pop();
    _uploadToFirebase(context);
  }

  _imgFromGallery(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });

    Navigator.of(context).pop();
    _uploadToFirebase(context);
  }

  void _picker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Gallery'),
                    onTap: () {
                      _imgFromGallery(context);
                    }),
                Builder(builder: (context) {
                  return ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () async {
                      await _imgFromCamera(context);
                    },
                  );
                }),
              ],
            ),
          );
        });
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

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        selectedDate = DateTime(selectedDate.year, selectedDate.month,
            selectedDate.day, selectedTime.hour, selectedTime.minute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
        backgroundColor: Color(c.appColor),
      ),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    InkWell(
                      child: CircleAvatar(
                        backgroundImage: (_imageURL == null || _imageURL == '')
                            ? const AssetImage("assets/dummy_user.jpg")
                                as ImageProvider
                            : NetworkImage(_imageURL),
                        backgroundColor: Color(c.appColor),
                        radius: 100,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileImages(
                                pageTitle: 'Image Gallery',
                                images: photos,
                                viewMode: c.EDITMODE)));
                      },
                    ),
                    const SizedBox(height: 5),
                    Text('*Click on the image to update the profile picture',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                            color: Color(c.appColor))),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      TextButton(
                        child: const Text('Reset Profile Picture'),
                        onPressed: () {
                          setState(() {
                            _imageURL = '';
                          });
                        },
                      ),
                      const SizedBox(width: 5),
                      TextButton(
                        child: const Text('Click to refresh'),
                        onPressed: () {
                          setState(() {
                            _fetchUserDetails();
                          });
                        },
                      ),
                    ])
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Colors.grey.shade600),
                child: const Flexible(
                  child: Text('Primary Details',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Full Name *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your full name";
                      }
                      return null;
                    },
                    controller: _displayname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _name,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Urgency *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedUrgencyValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedUrgencyValue = newValue!;
                        });
                      },
                      items: c.urgencyDropdownItems),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Gender *',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 30,
                      child: ListTile(
                        title: const Text('Male'),
                        leading: Radio(
                          toggleable: false,
                          value: 'Male',
                          onChanged: (value) {
                            setState(() {
                              _gender = value.toString();
                            });
                          },
                          groupValue: _gender,
                        ),
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 30,
                      child: ListTile(
                        title: const Text('Female'),
                        leading: Radio(
                          toggleable: false,
                          value: 'Female',
                          onChanged: (value) {
                            setState(() {
                              _gender = value.toString();
                            });
                          },
                          groupValue: _gender,
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Marital Status *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedMaritalStatusValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMaritalStatusValue = newValue!;
                        });
                      },
                      items: c.maritalDropdownItemsEdit),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Caste *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedCasteValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCasteValue = newValue!;
                          selectedSubCasteValue = selectedCasteValue == 'Jangam'
                              ? 'Beda'
                              : (selectedCasteValue == 'Lingayat'
                                  ? 'Aadi-Banajgar'
                                  : 'Lad Wani');
                        });
                      },
                      items: c.casteDropdownItemsEdit),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Subcaste *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedSubCasteValue,
                      // style: const TextStyle(color: Colors.red, fontSize: 30),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSubCasteValue = newValue!;
                        });
                      },
                      items: selectedCasteValue == 'Jangam'
                          ? c.subcastesOfJangamEdit
                          : (selectedCasteValue == 'Lingayat'
                              ? c.subcastesOfLingayatEdit
                              : c.subcastesOfLadWaniEdit)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Inter-caste Parents *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedIntercasteValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedIntercasteValue = newValue!;
                      });
                    },
                    items: c.intercasteDropdownItemsEdit,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(10.0),
                child: const Flexible(
                  child: Text(
                      '*Private information provided here with related to Address, ID and Income related documents are kept confidential and only meant for validating the Candidate profile.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontStyle: FontStyle.italic)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Colors.grey.shade600),
                child: const Flexible(
                  child: Text('Education and Profession',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Occupation *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedOccupationValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOccupationValue = newValue!;
                        });
                      },
                      items: c.occupationDropdownItemsEdit),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Annual Income',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedIncomeValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedIncomeValue = newValue!;
                        });
                      },
                      items: c.incomeDropdownItems),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Education Level *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedEducationValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedEducationValue = newValue!;
                        });
                      },
                      items: c.educationDropdownItemsEdit),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Educational Qualification *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Education Qualification";
                      }
                      return null;
                    },
                    controller: _qualificationCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _qualification,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Interested in settling abroad? *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedSettlingAbroadValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSettlingAbroadValue = newValue!;
                        });
                      },
                      items: c.settlingAbroadDropdownItems),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Residency Status',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedResidencyValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedResidencyValue = newValue!;
                        });
                      },
                      items: c.residencyDropdownItems),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Colors.grey.shade600),
                child: const Flexible(
                  child: Text('Contact Information',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Mobile No *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    readOnly: true,
                    controller: _contactPhoneCont,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade400,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _contactPhone,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Other Contacts No',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    controller: _contactPhoneContOther,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _contactPhoneOther,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Contact Address *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Contact Address";
                      }
                      return null;
                    },
                    controller: _addressCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _address,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Email *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    readOnly: true,
                    controller: _emailCont,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade400,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _email,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'City',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    controller: _cityCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _city,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'State',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    controller: _stateCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _state,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Country *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedCountryValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountryValue = newValue!;
                        });
                      },
                      items: c.countryDropdownItems),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Work City *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Work City";
                      }
                      return null;
                    },
                    controller: _workCityCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _workCity,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Reference-1 Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    controller: _refOneCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _refOne,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Reference-1 Phone',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    controller: _refOnePhoneCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _refOnePhone,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Reference-2 Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    controller: _refTwoCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _refTwo,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Reference-2 Phone',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    controller: _refTwoPhoneCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _refTwoPhone,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Colors.grey.shade600),
                child: const Flexible(
                  child: Text('Birth Information',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Birth Date *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Row(children: [
                    IconButton(
                        onPressed: () => _selectDate(context),
                        icon: const Icon(Icons.calendar_month_outlined),
                        color: Color(c.appColor)),
                    const SizedBox(width: 2),
                    Text(
                        selectedDate.toString().substring(0, 10) ==
                                DateTime.now().toString().substring(0, 10)
                            ? '(Select your birth date)'
                            : selectedDate.toString().substring(0, 10),
                        style: const TextStyle(fontSize: 14)),
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Birth Time *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Row(children: [
                    IconButton(
                        onPressed: () => _selectTime(context),
                        icon: const Icon(Icons.alarm),
                        color: Color(c.appColor)),
                    const SizedBox(width: 2),
                    Text(selectedTime.toString().substring(10, 15),
                        style: const TextStyle(fontSize: 14)),
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Birth City *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Birth City";
                      }
                      return null;
                    },
                    controller: _birthCityCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _birthCity,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'State *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Birth State";
                      }
                      return null;
                    },
                    controller: _birthStateCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _birthState,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Country *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedBirthCountryValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBirthCountryValue = newValue!;
                        });
                      },
                      items: c.countryDropdownItemsCopy),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Colors.grey.shade600),
                child: const Flexible(
                  child: Text('Patrika',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Rasi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedRasiValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedRasiValue = newValue!;
                        });
                      },
                      items: c.rasiDropdownItems),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Nakshatra',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedNakshatraValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedNakshatraValue = newValue!;
                        });
                      },
                      items: c.nakshatraDropdownItems),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Charan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedCharanValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCharanValue = newValue!;
                        });
                      },
                      items: c.charanDropdownItems),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Nadi *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedNadiValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedNadiValue = newValue!;
                        });
                      },
                      items: c.nadiDropdownItems),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Gan *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedGanValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedGanValue = newValue!;
                        });
                      },
                      items: c.ganDropdownItems),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Manglik Status *',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedManglikValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedManglikValue = newValue!;
                      });
                    },
                    items: c.manglikDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Colors.grey.shade600),
                child: const Flexible(
                  child: Text('Personal Attributes',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Blood Group',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedBloodValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedBloodValue = newValue!;
                      });
                    },
                    items: c.bloodDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Weight (kg)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    controller: _weightCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _weight,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Body Type',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedBodyValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedBodyValue = newValue!;
                      });
                    },
                    items: c.bodyDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Spectacles',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedSpectaclesValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSpectaclesValue = newValue!;
                      });
                    },
                    items: c.spectaclesDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Complexion',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedComplexionValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedComplexionValue = newValue!;
                      });
                    },
                    items: c.complexionDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Diet',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedDietValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDietValue = newValue!;
                      });
                    },
                    items: c.dietDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Smoke',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedSmokeValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSmokeValue = newValue!;
                      });
                    },
                    items: c.smokeDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Drink',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedDrinkValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDrinkValue = newValue!;
                      });
                    },
                    items: c.drinkDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Height (cm)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Slider(
                    value: _currentHeightValue,
                    min: 129,
                    max: 201,
                    divisions: 73,
                    label: _currentHeightValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentHeightValue = value;
                      });
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Physically Challenged',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedPhyValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedPhyValue = newValue!;
                      });
                    },
                    items: c.phyDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Mother Tongue',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedTongueValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTongueValue = newValue!;
                      });
                    },
                    items: c.tongueDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Other Information (yourself)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    controller: _infoCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _info,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Family Background',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    controller: _familyCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _family,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Relative Information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    controller: _relativeCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _relative,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Occupation (Employment History)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    controller: _occupationCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _occupation,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Colors.grey.shade600),
                child: const Flexible(
                  child: Text('Desired Characteristic of your Match',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Height (cm)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: RangeSlider(
                    values: _currentHeightValues,
                    min: 129,
                    max: 201,
                    divisions: 73,
                    labels: RangeLabels(
                      _currentHeightValues.start.round().toString(),
                      _currentHeightValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentHeightValues = values;
                        _heightLowValue = _currentHeightValues.start;
                        _heightHighValue = _currentHeightValues.end;
                      });
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Age',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: RangeSlider(
                    values: _currentAgeValues,
                    min: 20,
                    max: 50,
                    divisions: 31,
                    labels: RangeLabels(
                      _currentAgeValues.start.round().toString(),
                      _currentAgeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentAgeValues = values;
                        _ageLowValue = _currentAgeValues.start;
                        _ageHighValue = _currentAgeValues.end;
                      });
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Education Level',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                      value: selectedMatchEducationValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMatchEducationValue = newValue!;
                        });
                      },
                      items: c.educationDropdownItemsEditCopy),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Educational Qualification',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    controller: _matchQualificationCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _matchQualification,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Other Special Characteristics',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    controller: _specialCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      hintText: _special,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Manglik Status',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedMatchManglikValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMatchManglikValue = newValue!;
                      });
                    },
                    items: c.manglikDropdownItemsCopy,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Colors.grey.shade600),
                child: const Flexible(
                  child: Text('Are you open to',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Marrying outside your Subcaste',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedOutsideSubcasteValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOutsideSubcasteValue = newValue!;
                      });
                    },
                    items: c.marrySubcasteDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Marrying outside your Caste',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedOutsideCasteValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOutsideCasteValue = newValue!;
                      });
                    },
                    items: c.marryCasteDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Marry Inter-Caste',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedMarryIntercasteValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMarryIntercasteValue = newValue!;
                      });
                    },
                    items: c.marryIntercasteDropdownItems,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: const Text(
                    'Considering people who have been married earlier',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 15.0),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  DropdownButton(
                    value: selectedDivorcedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDivorcedValue = newValue!;
                      });
                    },
                    items: c.divorcedDropdownItems,
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  TextButton(
                    child: const Text('Upload Images'),
                    onPressed: () {
                      _picker(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    child: const Text('View Gallery'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfileImages(
                              pageTitle: 'Photo Gallery',
                              images: photos,
                              viewMode: c.EDITMODE)));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 15.0),
                    child: Container(
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
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
