import 'package:fanpage/HomeScreen/create_posts.dart';
import 'package:fanpage/LoginRegistration/login.dart';
import 'package:flutter/material.dart';

class BodyContent extends StatefulWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  final List _listOfPosts = [];

  bool _isAdmin(String userRole) {
    return userRole == 'ADMIN';
  }

  Widget _logout(context) {
    return AlertDialog(
        actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const Text('Confirmation'), SizedBox(height: 3)],
        ),
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.redAccent,
              ),
              RaisedButton(
                child: const Text('Ok', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  print('User really wants to logout :/');
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                      (Route route) => false);
                },
                color: Colors.green,
              ),
            ],
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _isAdmin('ADMIN')
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                tooltip: 'Add Post',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const CreatePosts();
                      });
                  print('You clicked the floating action button...');
                },
              )
            : null,
        appBar: AppBar(
          title: const Text('Fan Page App'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout_sharp),
              tooltip: 'Logout',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext buildContext) => _logout(context));
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _listOfPosts.isEmpty
                  ? const Text('There are no posts to `show.')
                  : ListView(),
            ],
          ),
        ));
  }
}
