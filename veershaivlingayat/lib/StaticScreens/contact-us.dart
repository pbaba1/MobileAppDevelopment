import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  String pageTitle;
  ContactUs({Key? key, required this.pageTitle}) : super(key: key);

  _launchURL() async {
    const url = 'https://www.facebook.com/public/Veershaivlingayat-Zirpe';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(currentPage: 'Contact Us'),
      appBar: AppBar(
        title: Text(pageTitle),
        backgroundColor: Color(c.appColor),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
              child: Text(
                'Veershaiv Vivah Mandal',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 15.0, 5.0),
            child: Icon(
              Icons.location_pin,
              size: 30,
              color: Color(c.appColor),
            ),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: Text('Krishna Chember,Basement Shop No. 5,',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text('Pune-Satara Road,Near Laxminarayan Theater/',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text('Near Central Bank of India, SWARGATE,',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text('Pune-411037,',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text('Maharashtra, India',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 25,
                    color: Color(c.appColor),
                  ),
                  const Text(' 020-24260062 / 020-24263879',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ))
                ],
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.mobile,
                    size: 25,
                    color: Color(c.appColor),
                  ),
                  const Text(' 9371029775 / 9420696689',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ))
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 0.0),
            child: Row(
              children: [
                Icon(
                  Icons.email,
                  size: 25,
                  color: Color(c.appColor),
                ),
                InkWell(
                    child: const Text(
                      ' veershaiv@gmail.com',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () => launch('mailto:veershaiv@gmail.com'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            child: Row(
              children: [
                Icon(
                  Icons.web,
                  size: 25,
                  color: Color(c.appColor),
                ),
                InkWell(
                    child: const Text(
                      ' www.veershaivlingayat.com',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () => launch('https://www.veershaivlingayat.com'))
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Text('Office Timings: 11:00 AM - 7:00 PM (Monday closed)',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(5, 10.0, 15.0, 0.0),
              child: GestureDetector(
                onTap: _launchURL,
                child: Image.asset(
                  'assets/facebook_logo.png',
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
              )),
        ]),
      ),
    );
  }
}
