import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class ShortlistedBlocked extends StatefulWidget {
  const ShortlistedBlocked({Key? key}) : super(key: key);

  @override
  _ShortlistedBlockedState createState() => _ShortlistedBlockedState();
}

class _ShortlistedBlockedState extends State<ShortlistedBlocked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(currentPage: 'Shortlisted/Blocked'),
      appBar: AppBar(
        title: const Text('Veershaiv Lingayat'),
        backgroundColor: Color(c.appColor),
      ),
      body: Column(children: const [
        Padding(
            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
            child: Text(
              'Shortlisted/Blocked Profiles',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ))
      ]),
    );
  }
}
