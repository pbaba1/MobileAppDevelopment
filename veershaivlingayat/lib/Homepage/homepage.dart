import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navdrawer(currentPage: 'Home'),
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Color(c.appColor),
        ),
        body: const Center(
          child: Text('This is homepage'),
        ));
  }
}
