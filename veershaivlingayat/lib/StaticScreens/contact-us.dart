import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

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
        title: const Text('Contact Us'),
        backgroundColor: Color(c.appColor),
      ),
      body: Center(
        child: Column(children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
              child: Text(
                'Veershaiv Vivah Mandal, Pune',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
              child: Text('Address:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))),
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
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text('Contact No : 020-24260062 /24263879',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              child: Text('Mobile:9371029775 /9420696689',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 0.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                        text: 'E-Mail: ',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        )),
                    TextSpan(
                      text: 'veershaiv@gmail.com',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch('mailto:veershaiv@gmail.com');
                        },
                    ),
                  ],
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                        text: 'Website: ',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        )),
                    TextSpan(
                      text: 'www.veershaivlingayat.com',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch('www.veershaivlingayat.com');
                        },
                    ),
                  ],
                ),
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 0.0),
              child: Text('Office Timings: 11:00 AM - 7:00 PM (Monday closed)',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
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
