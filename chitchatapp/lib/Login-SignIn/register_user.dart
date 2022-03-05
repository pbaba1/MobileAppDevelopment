import 'package:chitchatapp/Login-SignIn/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as FBA;
import 'package:firebase_storage/firebase_storage.dart' as FBS;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io' as i;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _registerForm = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool _isTextObscure = true;
  final FBA.FirebaseAuth _firebaseAuthInstance = FBA.FirebaseAuth.instance;

  // file upload
  bool _isImageUploadError = false;
  String? userName = '';
  var downloadUrl = '';
  i.File _imageFile = new i.File('');

  Widget fetchIcon(String fieldName) {
    switch (fieldName) {
      case 'fname':
      case 'lname':
        return const Icon(Icons.person_outlined);
      case 'email':
        return const Icon(Icons.email);
      case 'password':
        return IconButton(
            onPressed: () => setState(() {
                  if (_passwordController.text.trim() != '') {
                    _isTextObscure = !_isTextObscure;
                  }
                }),
            icon:
                Icon(_isTextObscure ? Icons.visibility_off : Icons.visibility));
      case 'cpassword':
        return const Icon(Icons.visibility_off);
    }
    return Container();
  }

  InputDecoration _textDecorationValue(
      String labelTextValue, String hintTextValue, String fieldName) {
    return InputDecoration(
        alignLabelWithHint: true,
        suffixIcon: fetchIcon(fieldName),
        labelText: labelTextValue,
        hintText: hintTextValue,
        border: fieldName == 'bio' ? const OutlineInputBorder() : null);
  }

  _registerUser() async {
    try {
      FBA.UserCredential userCredential =
          await _firebaseAuthInstance.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      if (userCredential.user != null) {
        FirebaseFirestore _firestore = FirebaseFirestore.instance;
        CollectionReference users = _firestore.collection('users');
        try {
          await users.doc(userCredential.user!.uid).set({
            'fname': _firstNameController.text,
            'lname': _lastNameController.text,
            'display_name':
                (_firstNameController.text + ' ' + _lastNameController.text)
                    .toLowerCase(),
            'email': _emailController.text,
            'user_creation_timestamp': DateTime.now(),
            'image_url': downloadUrl
          });
          FBA.FirebaseAuth.instance.signOut();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('User created!')));
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Login()),
              (Route route) => false);
          // _storeUserInDB(userCredential.user);
        } catch (e) {
          print('there was an error storing the user in DB....');
          print(e);
        }

        // _storeUserInDB(userCredential.user);
      }
      await _firebaseAuthInstance.signOut();
    } on FBA.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future _uploadToFirebase(BuildContext context) async {
    String fileName = Path.basename(_imageFile.path);
    FBS.FirebaseStorage storage = FBS.FirebaseStorage.instance;
    FBS.Reference ref =
        storage.ref().child('images/' + DateTime.now().toString());
    try {
      FBS.UploadTask uploadTask = ref.putFile(_imageFile);
      uploadTask.then((res) {
        res.ref.getDownloadURL();
      });

      downloadUrl = await (await uploadTask).ref.getDownloadURL();
      setState(() {
        _isImageUploadError = false;
      });
    } catch (e) {
      setState(() {
        _isImageUploadError = true;
      });
    }
  }

  _imgFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _imageFile = i.File(pickedFile!.path);
    });

    _uploadToFirebase(context);
  }

  _imgFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = i.File(pickedFile!.path);
    });

    _uploadToFirebase(context);
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                Builder(builder: (context) {
                  return ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  );
                }),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _registerForm,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/chat_app_icon.png',
                    height: 50,
                    width: 50,
                    color: Colors.indigo,
                  ),
                  const Text('ChitChat App',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                      )),
                ],
              ),
              /*  (!_isImageUploadError && _imageFile != null && _imageFile != '')
                  ? Text('Image selected sucessfully!')
                  : Container(), */
              // FIRST NAME
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a valid first name';
                      }
                      return null;
                    },
                    controller: _firstNameController,
                    decoration: _textDecorationValue(
                        'First Name', 'First Name', 'fname')),
              ),
              // LAST NAME
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a valid last name';
                      }
                      return null;
                    },
                    controller: _lastNameController,
                    decoration: _textDecorationValue(
                        'Last Name', 'Last Name', 'lname')),
              ),
              // EMAIL ADDRESS
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter an email address';
                      } else if (!value.contains('@')) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration:
                        _textDecorationValue('Email', 'Email', 'email')),
              ),
              // PASSWORD
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a password';
                    } else if (value.length < 6) {
                      return 'Enter a password greater than 6 characters';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration:
                      _textDecorationValue('Password', 'Password', 'password'),
                  obscureText: _isTextObscure,
                ),
              ),
              // CONFIRM PASSWORD
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a password to confirm';
                    } else if (value != _passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  decoration: _textDecorationValue(
                      'Confirm Password', 'Confirm Password', 'cpassword'),
                  obscureText: true,
                ),
              ),
              // UPLOAD IMAGE
              TextButton(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Choose a profile photo',
                          style: TextStyle(color: Colors.indigo),
                        ),
                        IconButton(
                            onPressed: () {
                              // _showPicker(context);
                            },
                            icon: const Icon(Icons.camera_alt_rounded))
                      ]),
                  onPressed: () => _showPicker(context)),
              const SizedBox(height: 10),
              // REGISTER BUTTON
              Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      _registerForm.currentState!.validate()
                          ? _registerUser()
                          : null;
                    },
                  )),
              const SizedBox(height: 10),
              // BACK TO LOGIN PAGE
              TextButton(
                  child: const Text('Click here to login',
                      style: TextStyle(color: Colors.indigo)),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()))),
            ],
          ),
        ),
      ),
    ));
  }
}
