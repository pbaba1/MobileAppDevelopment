import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class SearchProfiles extends StatefulWidget {
  const SearchProfiles({Key? key}) : super(key: key);

  @override
  _SearchProfilesState createState() => _SearchProfilesState();
}

class _SearchProfilesState extends State<SearchProfiles> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _profileid = TextEditingController();
  final TextEditingController _name = TextEditingController();
  RangeValues _currentHeightValues = const RangeValues(129, 201);
  RangeValues _currentAgeValues = const RangeValues(20, 50);
  String selectedCasteValue = "All";
  String selectedSubCasteValue = "All";
  String selectedEducationValue = "All";
  String selectedUrgencyValue = " ";
  String selectedOccupationValue = "Any";
  String selectedMaritalValue = "NA";
  String selectedManglikValue = "NA";
  String selectedRCasteValue = "NA";
  String selectedRSubcasteValue = "NA";
  String selectedIntercasteValue = "NA";
  String selectedRIntercasteValue = "NA";
  String selectedTongueValue = " ";
  bool _advanced = false;

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
                    onChanged: null,
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
                            'Employment',
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
                            controller: _name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              hintText: 'Enter Employment',
                            )),
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
                            controller: _name,
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
                            controller: _name,
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
                            controller: _name,
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
                        // _form.currentState!.validate() ? _login() : null;
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => const Homepage()));
                        print("Search");
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
                        // _form.currentState!.validate() ? _login() : null;
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => const Homepage()));
                        setState(() {
                          _currentHeightValues = const RangeValues(129, 201);
                          _currentAgeValues = const RangeValues(20, 50);
                          selectedCasteValue = "All";
                          selectedSubCasteValue = "All";
                          selectedEducationValue = "All";
                          selectedUrgencyValue = " ";
                          _name.clear();
                          _profileid.clear();
                        });
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
