import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class Homepage extends StatefulWidget {
  String pageTitle;
  Homepage({Key? key, required this.pageTitle}) : super(key: key);

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
        body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: const Text(
                        'Hi, Pooja Basavraj Baba (ID: 37957) - Profile has been expired. Click Here to make Payment online and renew your profile or contact Veershaiv Vivah Mandal Office',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Flexible(
                          child: Text('Your last visit',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                        Flexible(
                          child: Text('13/04/2022 11:38 PM',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Flexible(
                          child: Text('Expires on',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                        Flexible(
                          child: Text('20/02/2022',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Flexible(
                          child: Text('Profile Completeness',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                        Flexible(
                          child: Text('94%',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Flexible(
                          child: Text('Credit Remaining',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                        Flexible(
                          child: Text('Rs. 0 / -',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Flexible(
                          child: Text('Interest Sent / Received',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                        Flexible(
                          child: Text('0 / 0',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Flexible(
                          child: Text('Shortlisted / Blocked Profiles',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                        Flexible(
                          child: Text('0 / 0',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: const Text('Search Profiles',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: const Text('Melawa Information',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )),
        ));
  }
}
