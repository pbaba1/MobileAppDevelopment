// import 'package:flutter/material.dart';
// import 'package:recase/recase.dart';

// class ChatWithUser extends StatefulWidget {
//   final String? userImageURL;
//   final String? displayName;
//   final String? email;
//   const ChatWithUser(data,
//       {Key? key,
//       required this.userImageURL,
//       required this.displayName,
//       required this.email})
//       : super(key: key);

//   @override
//   _ChatWithUserState createState() => _ChatWithUserState();
// }

// class _ChatWithUserState extends State<ChatWithUser> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(ReCase(widget.displayName.toString()).titleCase.toString()),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: <Widget>[
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Container(
//               padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
//               height: 60,
//               width: double.infinity,
//               color: Colors.white,
//               child: Row(
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       height: 30,
//                       width: 30,
//                       decoration: BoxDecoration(
//                         color: Colors.lightBlue,
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: Icon(
//                         Icons.add,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                           hintText: "Create a message",
//                           hintStyle: TextStyle(color: Colors.black54),
//                           border: InputBorder.none),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {},
//                     child: Icon(
//                       Icons.send,
//                       color: Colors.white,
//                       size: 18,
//                     ),
//                     backgroundColor: Colors.blue,
//                     elevation: 0,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   final String text;
//   final String _name = 'John Doe';
//   final AnimationController animationController;
//   const ChatMessage(
//       {Key? key, required this.text, required this.animationController})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizeTransition(
//       sizeFactor:
//           CurvedAnimation(parent: animationController, curve: Curves.easeOut),
//       axisAlignment: 0.0,
//       child: Container(
//           margin: EdgeInsets.all(3),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                   margin: const EdgeInsets.only(right: 16),
//                   child: CircleAvatar(child: Text(_name[0]))),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(_name, style: Theme.of(context).textTheme.headline4),
//                   Container(
//                       margin: const EdgeInsets.only(top: 5), child: Text(text))
//                 ],
//               )
//             ],
//           )),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart' as FBA;
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import '../Login-SignIn/login.dart';
import 'package:chitchatapp/Chats-UserDetails/user_profile.dart' as up;
// import 'package:fluttertoast/fluttertoast.dart';

class ChatWithUser extends StatefulWidget {
  final String? userImageURL;
  final String? displayName;
  final String? email;
  const ChatWithUser(data,
      {Key? key,
      required this.userImageURL,
      required this.displayName,
      required this.email})
      : super(key: key);

  @override
  State<ChatWithUser> createState() => _ChatWithUserState();
}

class _ChatWithUserState extends State<ChatWithUser>
    with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final FocusNode _focusNode = FocusNode();
  String? currentUserName = '';
  bool isCurrentUser = false;

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              Flexible(
                  child: TextField(
                      focusNode: _focusNode,
                      controller: _textController,
                      onSubmitted: _handleSubmission,
                      decoration: const InputDecoration.collapsed(
                          hintText: 'Type a message'))),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      _handleSubmission(_textController.text);
                    },
                  ))
            ],
          )),
    );
  }

  void _handleSubmission(String text) {
    _textController.clear();
    var message = ChatMessage(
      text: text,
      animationController: AnimationController(
          duration: const Duration(milliseconds: 700), vsync: this),
    );
    setState(() {
      if (text != '') {
        _messages.insert(0, message);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Please enter message'),
            duration: const Duration(seconds: 1)));

        // Fluttertoast.showToast(
        //     msg: 'Please enter message',
        //     gravity: ToastGravity.CENTER,
        //     backgroundColor: Colors.red,
        //     toastLength: Toast.LENGTH_SHORT);
      }
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

  _fetchUserDetails() {
    FBA.FirebaseAuth _firebaseAuth = FBA.FirebaseAuth.instance;
    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    User? user;
    _firebaseAuth.authStateChanges().listen((FBA.User? u) {
      user = u as User;
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
            (Route route) => false);
      } else {
        _firebaseFirestore
            .collection('users')
            .doc(user?.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {
                  setState(() {
                    isCurrentUser =
                        snapshot['display_name'] == widget.displayName;
                  })
                });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setState(() {
    //   if(widget.displayName != null) {
    //     isCurrentUser =
    //         FirebaseAuth.instance.currentUser?.displayName! == widget.displayName;
    //   }
    // });
    _fetchUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: InkWell(
          child: Row(
            children: [
              CircleAvatar(
                  radius: 20,
                  backgroundImage: widget.userImageURL != null
                      ? NetworkImage(widget.userImageURL.toString())
                      : const AssetImage('assets/dummy_user.jpg')
                          as ImageProvider),
              const SizedBox(width: 5),
              Text(ReCase(widget.displayName.toString()).titleCase),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => up.UserProfile(
                      userImageURL: widget.userImageURL,
                      displayName: widget.displayName,
                      email: widget.email,
                    )));
          },
        )),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  reverse: true,
                  itemBuilder: (_, index) => _messages[index],
                  itemCount: _messages.length),
            ),
            const Divider(height: 1),
            Container(
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer())
          ],
        ));
  }

  @override
  void dispose() {
    for (var message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;
  const ChatMessage(
      {Key? key, required this.text, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
          margin: EdgeInsets.all(3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          /* _ChatWithUserState().isCurrentUser
                              ? Colors.blue
                              : Colors.grey[300], */
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(text),
                        ),
                      ))
                ],
              )
            ],
          )),
    );
  }
}
