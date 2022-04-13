import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class MelawaInformation extends StatefulWidget {
  const MelawaInformation({Key? key}) : super(key: key);

  @override
  _MelawaInformationState createState() => _MelawaInformationState();
}

class _MelawaInformationState extends State<MelawaInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(currentPage: 'Melawa Information'),
      appBar: AppBar(
        title: const Text('Veershaiv Lingayat'),
        backgroundColor: Color(c.appColor),
      ),
      body: Column(children: const [
        Padding(
            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
            child: Text(
              'Melawa Information',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ))
      ]),
    );
  }
}
