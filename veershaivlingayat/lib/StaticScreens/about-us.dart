import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class AboutUs extends StatelessWidget {
  String pageTitle;
  AboutUs({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(currentPage: 'About Us'),
      appBar: AppBar(
        title: Text(pageTitle),
        backgroundColor: Color(c.appColor),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                  child: Text(
                    'Veershaiv Vivah Mandal',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text(
                  'Keshav Ramchandra Zirpe started this service of matchmaking in 1950. This was his hobby and passion. He never took a single penny for this service. Thousands of people met their life partners due to his efforts.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: RichText(
                textAlign: TextAlign.justify,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Now me Ramling his son and Daughter in law Renuka are following in his footstep who are keen for matchmaking. In 2001 we founded'),
                    TextSpan(
                        text: ' veershaivlingayat.com ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'solely for Lingayat community.'),
                  ],
                ),
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text(
                  'Many initiatives have been taken by us while interacting with the new generation. We are going by Principle go slow but steady. Since 2004 we started arranging get together (Vadhu Var Melawa) for all brides and grooms with their parents.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text(
                  'This gathering based on different categories like education wise, profession wise, marital status wise and so on. Every year thousands of people are participating and many of them get their soul partner in this gathering only.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
            child: Column(
              children: const [
                CircleAvatar(
                    backgroundImage: AssetImage('assets/about_us_img1.jpeg'),
                    radius: 75),
                Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                    child: Text(
                      'Ramling Zirpe',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
