import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/QuickMenu/search-results.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class SearchProfiles extends StatefulWidget {
  String pageTitle;
  SearchProfiles({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _SearchProfilesState createState() => _SearchProfilesState();
}

class _SearchProfilesState extends State<SearchProfiles> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _profileid = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _cityCont = TextEditingController();
  final TextEditingController _nativeCityCont = TextEditingController();
  final TextEditingController _workCityCont = TextEditingController();
  RangeValues _currentHeightValues = const RangeValues(129, 201);
  RangeValues _currentAgeValues = const RangeValues(20, 50);
  String selectedCasteValue = "All";
  String selectedSubCasteValue = "All";
  String selectedEducationValue = "All";
  String selectedUrgencyValue = "Select any one option";
  String selectedOccupationValue = "Any";
  String selectedMaritalValue = "Not Applicable";
  String selectedManglikValue = "Not Applicable";
  String selectedRCasteValue = "Not Applicable";
  String selectedRSubcasteValue = "Not Applicable";
  String selectedIntercasteValue = "Not Applicable";
  String selectedRIntercasteValue = "Not Applicable";
  String selectedTongueValue = "Please select";
  bool _advanced = false;

  Map<String, dynamic> searchParameters = {
    'simple_search': {
      'id': 1000,
      'name': '',
      'height': 0,
      'age': 0,
      'caste': '',
      'subcaste': '',
      'education': '',
      'urgency': '',
    },
    'advanced_search': {
      'occupation': '',
      'contact_city': '',
      'birth_city': '',
      'marital_status': '',
      'manglik_status': '',
      'marry_outside_caste': '',
      'marry_outside_subcaste': '',
      'work_city': '',
      'intercaste_parents': '',
      'marry_intercaste': '',
      'mother_tongue': ''
    }
  };

  preparePayload() {
    searchParameters['simple_search']['name'] = _name.text;
    searchParameters['simple_search']['id'] = _profileid.text;
    searchParameters['simple_search']['height'] =
        _currentHeightValues.start.round();
    searchParameters['simple_search']['age'] = _currentAgeValues.start.round();
    searchParameters['simple_search']['caste'] = selectedCasteValue;
    searchParameters['simple_search']['subcaste'] = selectedSubCasteValue;
    searchParameters['simple_search']['education'] = selectedEducationValue;
    searchParameters['simple_search']['urgency'] = selectedUrgencyValue;
    searchParameters['advanced_search']['occupation'] = selectedOccupationValue;
    searchParameters['advanced_search']['contact_city'] = _cityCont.text;
    searchParameters['advanced_search']['birth_city'] = _nativeCityCont.text;
    searchParameters['advanced_search']['marital_status'] =
        selectedMaritalValue;
    searchParameters['advanced_search']['manglik_status'] =
        selectedManglikValue;
    searchParameters['advanced_search']['marry_outside_caste'] =
        selectedRCasteValue;
    searchParameters['advanced_search']['marry_outside_subcaste'] =
        selectedRSubcasteValue;
    searchParameters['advanced_search']['work_city'] = _workCityCont.text;
    searchParameters['advanced_search']['intercaste_parents'] =
        selectedIntercasteValue;
    searchParameters['advanced_search']['marry_intercaste'] =
        selectedRIntercasteValue;
    searchParameters['advanced_search']['mother_tongue'] = selectedTongueValue;
  }

  resetFields() {
    setState(() {
      _profileid.clear();
      _name.clear();
      _cityCont.clear();
      _nativeCityCont.clear();
      _workCityCont.clear();
      _currentHeightValues = const RangeValues(129, 201);
      _currentAgeValues = const RangeValues(20, 50);
      selectedCasteValue = "All";
      selectedSubCasteValue = "All";
      selectedEducationValue = "All";
      selectedUrgencyValue = "Select any one option";
      selectedOccupationValue = "Any";
      selectedMaritalValue = "Not Applicable";
      selectedManglikValue = "Not Applicable";
      selectedRCasteValue = "Not Applicable";
      selectedRSubcasteValue = "Not Applicable";
      selectedIntercasteValue = "Not Applicable";
      selectedRIntercasteValue = "Not Applicable";
      selectedTongueValue = "Please select";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(currentPage: 'Search Profiles'),
      appBar: AppBar(
        title: const Text('Search Profiles'),
        backgroundColor: Color(c.appColor),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: const Text(
                  'Profile ID',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: TextFormField(
                  controller: _profileid,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    hintText: 'Enter Profile ID',
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: const Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    hintText: 'Enter Name',
                  )),
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
                  'Caste',
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
                      });
                    },
                    items: c.casteDropdownItems),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: const Text(
                  'Subcaste',
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
                        ? c.subcastesOfJangam
                        : (selectedCasteValue == 'Lingayat'
                            ? c.subcastesOfLingayat
                            : c.subcastesOfLadWani)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: const Text(
                  'Education',
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
                    items: c.educationDropdownItems),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: const Text(
                  'Urgency',
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
          _advanced
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0, bottom: 0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: const Text(
                            'Occupation',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
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
                              items: c.occupationDropdownItems),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0, bottom: 0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: const Text(
                            'Contact City',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
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
                              hintText: 'Enter Contact City',
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0, bottom: 0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: const Text(
                            'Native City',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10.0, bottom: 0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        child: TextFormField(
                            controller: _nativeCityCont,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              hintText: 'Enter Native City',
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0, bottom: 0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: const Text(
                            'Marital Status',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10.0, bottom: 0),
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(15)),
                          DropdownButton(
                            value: selectedMaritalValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedMaritalValue = newValue!;
                              });
                            },
                            items: c.maritalDropdownItems,
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
                            'Manglik Status',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
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
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: const Text(
                            'Ready to marry outside Caste',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10.0, bottom: 0),
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(15)),
                          DropdownButton(
                            value: selectedRCasteValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedRCasteValue = newValue!;
                              });
                            },
                            items: c.rCasteDropdownItems,
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
                            'Ready to marry outside Subcaste',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10.0, bottom: 0),
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(15)),
                          DropdownButton(
                            value: selectedRSubcasteValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedRSubcasteValue = newValue!;
                              });
                            },
                            items: c.rSubcasteDropdownItems,
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
                            'Work City',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10.0, bottom: 0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        child: TextFormField(
                            controller: _workCityCont,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              hintText: 'Enter Work City',
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0, bottom: 0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: const Text(
                            'Inter-caste Parents',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
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
                            items: c.intercasteDropdownItems,
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
                            'Ready to marry Inter-caste',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 10.0, bottom: 0),
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(15)),
                          DropdownButton(
                            value: selectedRIntercasteValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedRIntercasteValue = newValue!;
                              });
                            },
                            items: c.rIntercasteDropdownItems,
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
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
                  ],
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 0),
            child: Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * .5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(32.0)),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _advanced = !_advanced;
                    });
                  },
                  child: _advanced
                      ? const Text(
                          "Simple Search",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )
                      : const Text(
                          "Advanced Search",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(32.0)),
                    child: FlatButton(
                      onPressed: () {
                        preparePayload();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SearchResults(
                                      searchType: _advanced
                                          ? 'AdvancedSearch'
                                          : 'SimpleSearch',
                                      searchParameters: searchParameters,
                                    )));
                      },
                      child: const Text(
                        'Search',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(32.0)),
                    child: FlatButton(
                      onPressed: () {
                        resetFields();
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
