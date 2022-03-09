import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FBA;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import '../Login-SignIn/login.dart';
import 'package:chitchatapp/Chats-UserDetails/user_profile.dart' as up;

class ChatWithUser extends StatefulWidget {
  final String? userImageURL;
  final String? displayName;
  final String? email;
  final String userID;
  final Timestamp dateCreated;
  const ChatWithUser(
      {Key? key,
      required this.userID,
      required this.userImageURL,
      required this.displayName,
      required this.dateCreated,
      required this.email})
      : super(key: key);

  @override
  State<ChatWithUser> createState() => _ChatWithUserState();
}

class _ChatWithUserState extends State<ChatWithUser> {
  final _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  String? currentUserName = '';
  String currentUserID = '';
  bool isCurrentUser = false;
  List<dynamic>? messageList;

  void storeMessageInDB(String content) async {
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(currentUserID.toString() + widget.userID.toString())
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
        Map<String, dynamic> data =
            documentSnapshot.data()! as Map<String, dynamic>;

        var messages = data['messages'];

        // now we need to update this message
        // we need to create one map
        Map<String, dynamic> obj = Map<String, dynamic>();
        obj["content"] = _textController.text;
        obj["createdBy"] = currentUserID;
        obj["createdAt"] = DateTime.now();

        messages.add(obj);

        FirebaseFirestore.instance
            .collection("messages")
            .doc(currentUserID.toString() + widget.userID.toString())
            .update({'messages': messages})
            .then((value) => print("document updated successfully."))
            .then((value) => {
                  // clear the message
                  _textController.clear()
                });
      } else {
        print(
            "document does not exists in the database. checking other document.");
        FirebaseFirestore.instance
            .collection('messages')
            .doc(widget.userID.toString() + currentUserID.toString())
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            print('Document exists on the database');
            Map<String, dynamic> data =
                documentSnapshot.data()! as Map<String, dynamic>;

            var messages = data['messages'];

            // now we need to update this message
            // we need to create one map
            Map<String, dynamic> obj = new Map<String, dynamic>();
            obj["content"] = _textController.text;
            obj["createdBy"] = currentUserID;
            obj["createdAt"] = DateTime.now();

            messages.add(obj);

            FirebaseFirestore.instance
                .collection("messages")
                .doc(widget.userID.toString() + currentUserID.toString())
                .update({'messages': messages})
                .then((value) => print("document updated successfully."))
                .then((value) => {
                      // clear the message
                      _textController.clear()
                    });
          } else {
            // userId+peerId // peerId + userId does not exist.
            print("nothing exists");

            // create new document
            // set foloowing data
            Map<String, dynamic> obj = new Map<String, dynamic>();
            obj["content"] = _textController.text;
            obj["createdBy"] = currentUserID;
            obj["createdAt"] = DateTime.now();

            var messages = [];
            messages.add(obj);

            FirebaseFirestore.instance
                .collection('messages')
                .doc(currentUserID.toString() + widget.userID.toString())
                .set({'messages': messages}).then((value) {
              print("new document is created");
              _textController.clear();
            }).catchError((onError) =>
                    print("error occurred while creating new document"));
          }
        });
      }
    });
  }

  _handleSubmission(String text) {
    if (text != '') {
      storeMessageInDB(text);
    } else {
      // showDialog(context: context, builder: AlertDialog(content: Text('Enter a message to send.'),));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Please enter message'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.45),
      ));
    }
  }

  _fetchUserDetails() {
    FBA.FirebaseAuth _firebaseAuth = FBA.FirebaseAuth.instance;
    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    FBA.User? user;
    _firebaseAuth.authStateChanges().listen((FBA.User? u) {
      user = u as FBA.User;
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
                    currentUserName = snapshot['display_name'];
                    currentUserID = snapshot.id;
    
                    // _fetchUserChats();
                  })
                });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*  setState(() {
      if (widget.displayName != null) {
        isCurrentUser = FirebaseAuth.instance.currentUser?.displayName! ==
            widget.displayName;
        currentUserID = FBA.FirebaseAuth.instance.currentUser!.uid.toString();
        // _fetchUserChats();
      }
    }); */
    _fetchUserDetails();
  }

  Widget buildItem(int index, var d, var userId) {
    if (d[index]['createdBy'] == userId) {
      // Right (my message)
      return Row(
        children: <Widget>[
          // Text
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Bubble(
                  color: Colors.blueGrey,
                  elevation: 0,
                  padding: const BubbleEdges.all(10.0),
                  nip: BubbleNip.rightTop,
                  child: Text(d[index]['content'],
                      style: const TextStyle(color: Colors.white))),
              width: 200)
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      );
    } else {
      // Left (peer message)
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                child: Bubble(
                    color: Colors.indigoAccent,
                    elevation: 0,
                    padding: const BubbleEdges.all(10.0),
                    nip: BubbleNip.leftTop,
                    child: Text(d[index]['content'],
                        style: const TextStyle(color: Colors.white))),
                width: 200.0,
                margin: const EdgeInsets.only(left: 10.0),
              )
            ])
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      );
    }
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
                      dateCreated: widget.dateCreated,
                      displayName: widget.displayName,
                      email: widget.email,
                      userID: widget.userID,
                    )));
          },
        )),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('messages').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: LinearProgressIndicator(color: Colors.indigo));
            }

            // get the document from collection
            int i = 0, k = 100;
            Map<String, dynamic> data = {};

            for (var j = 0; j < snapshot.data!.docs.length; j++) {
              if (snapshot.data!.docs[j].id ==
                      currentUserID.toString() + widget.userID.toString() ||
                  snapshot.data!.docs[j].id ==
                      widget.userID.toString() + currentUserID.toString()) {
                // id matched
                data = snapshot.data!.docs[j].data()! as Map<String, dynamic>;
                k = j;
                break;
              }
            }

            if (k != 100) {
              // k is not changed.
              // chat has not been started
              var arr = List.from(data['messages'].reversed);

              if (arr.isNotEmpty) {
                return ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemBuilder: (BuildContext context, int index) =>
                      buildItem(index, arr, currentUserID),
                  itemCount: data['messages'].length,
                  reverse: true,
                );
              }
            }

            return const Center(
                child: Text(
                    "No messages. Type message to start a conversation.",
                    style: TextStyle(fontSize: 18, color: Colors.red)));
          },
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 1, color: Colors.grey))),
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                      hintText: "Write message...",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                onPressed: () {
                  _handleSubmission(_textController.text);
                },
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 18,
                ),
                backgroundColor: Colors.blue,
                elevation: 0,
              ),
            ],
          ),
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
              SingleChildScrollView(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: _ChatWithUserState().isCurrentUser
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(text),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
