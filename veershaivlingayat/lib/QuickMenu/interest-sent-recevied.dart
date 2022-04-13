import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class InterestSentRecevied extends StatefulWidget {
  const InterestSentRecevied({Key? key}) : super(key: key);

  @override
  _InterestSentReceviedState createState() => _InterestSentReceviedState();
}

class _InterestSentReceviedState extends State<InterestSentRecevied> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(currentPage: 'Interest Sent/Received'),
      appBar: AppBar(
        title: const Text('Veershaiv Lingayat'),
        backgroundColor: Color(c.appColor),
      ),
      body: Column(children: const [
        Padding(
            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
            child: Text(
              'Interest Sent/Recevied',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ))
      ]),
    );
  }
}
