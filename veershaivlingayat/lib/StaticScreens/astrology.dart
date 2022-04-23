import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

class Astrology extends StatelessWidget {
  String pageTitle;
  Astrology({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(currentPage: 'Astrology'),
      appBar: AppBar(
        title: Text(pageTitle),
        backgroundColor: Color(c.appColor),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
              child: Text(
                  'Know what the future holds for you! Match yourself with your partner! Get your Queries Solved. All this delivered right at your doorstep......',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
              child: Text('offers the following three Astrological Services:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Horoscope: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Including Predictions'),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Horoscope Matching: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'For You with Your Partner'),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Ask Panditji: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'Ask different queries get an perfect astrological solution from our experts.'),
                      ],
                    ),
                  )
                ],
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Text('Details of their Report Formats:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text(
                  'The report can be sent in Print Format by courier to any address in India. OR The report can be sent by e-mail .',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Text('Costs of Services:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Horoscope: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: 'Including Predictions:  Rs.500 /- '),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Horoscope Matching: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: 'For You with Your Partner: Rs 500/-'),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Ask Panditji: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'Ask different queries get an perfect astrological solution from our experts: Rs. 500 /- '),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Method of Payment: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'Demand Draft'),
                ],
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text('It Should be the Name of:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text('It be Addressed to:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Text('Tell details by mailing us on',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ))),
        ]),
      ),
    );
  }
}
