import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class Gunmilan extends StatefulWidget {
  String pageTitle;
  Gunmilan({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _GunmilanState createState() => _GunmilanState();
}

class _GunmilanState extends State<Gunmilan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(currentPage: 'Gunmilan'),
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
