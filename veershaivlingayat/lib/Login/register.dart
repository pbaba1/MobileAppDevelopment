import 'package:flutter/material.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

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
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  String gender = '';
  DateTime selectedDate = DateTime.now();
  String selectedCasteValue = 'Jangam';
  String selectedSubCasteValue = '';

  void _submit() {}

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
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
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _form,
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.asset('assets/banner.jpg'),
                      ),
                      SizedBox(height: 2),
                      // full name
                      SizedBox(
                          height: 40,
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
                      // gender
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 30,
                                    child: ListTile(
                                      title: const Text('Male'),
                                      leading: Radio(
                                        value: 'Male',
                                        onChanged: (value) {
                                          setState(() {
                                            print(value);
                                          });
                                        },
                                        groupValue: '',
                                      ),
                                    )),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 30,
                                    child: ListTile(
                                      title: const Text('Female'),
                                      leading: Radio(
                                        value: 'Female',
                                        onChanged: (value) {
                                          setState(() {
                                            print(value);
                                          });
                                        },
                                        groupValue: '',
                                      ),
                                    )),
                              ],
                            )),
                      ),
                      // date picker
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Select date'),
                      ),
                      // caste dropdown
                      DropdownButton(
                          value: selectedCasteValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCasteValue = newValue!;
                            });
                          },
                          items: c.casteDropdownItems),
                      // subcaste dropdown
                      DropdownButton(
                          value: selectedCasteValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCasteValue = newValue!;
                            });
                          },
                          items: c.casteDropdownItems),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .9,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a username";
                                }
                                return null;
                              },
                              controller: username,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
                                labelText: 'Username',
                                hintText: 'Enter username',
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .9,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter password";
                                }
                                return null;
                              },
                              controller: fullName,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
                                // labelText: 'Full Name',
                                hintText: 'Enter the password',
                              ),
                            )),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .5,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(32.0)),
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
                      const Padding(padding: EdgeInsets.all(5.0)),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
