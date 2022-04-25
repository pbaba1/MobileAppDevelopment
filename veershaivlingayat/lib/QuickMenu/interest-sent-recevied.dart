import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class InterestSentRecevied extends StatefulWidget {
  String pageTitle;
  InterestSentRecevied({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _InterestSentReceviedState createState() => _InterestSentReceviedState();
}

class _InterestSentReceviedState extends State<InterestSentRecevied> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(currentPage: 'Interest Sent'),
      appBar: AppBar(
        title: Text(widget.pageTitle),
        backgroundColor: Color(c.appColor),
      ),
      body: Column(children: const [
        Padding(
            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
            child: Text(
              '',
            ))
      ]),
    );
  }
}