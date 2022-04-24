import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:veershaivlingayat/Homepage/navdrawer.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;
import 'package:url_launcher/url_launcher.dart';

class FAQ extends StatelessWidget {
  String pageTitle;
  FAQ({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(currentPage: 'FAQ'),
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
              )),
          Padding(
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
                    child: Text(
                        'Can I register online & upload my photo on www.veershaivlingayat.com?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue.shade900,
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
                    child: const Text(
                        'Yes, You can register online. Once you register online please see section "How do I activate my Profile?"',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14.0, color: Colors.black)),
                  ),
                ],
              )),
          Padding(
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
                    child: Text('How do I activate my Profile?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue.shade900,
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
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                  text:
                                      'After successfull payment done please ensure following things to be submitted to our '),
                              const TextSpan(
                                  text: 'Office Address ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const TextSpan(text: '(as given below) or '),
                              const TextSpan(
                                  text: 'on Email ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const TextSpan(text: '('),
                              TextSpan(
                                text: 'veershaiv@gmail.com',
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch('mailto:veershaiv@gmail.com');
                                  },
                              ),
                              const TextSpan(text: ') or on '),
                              const TextSpan(
                                  text: 'WhatsApp ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const TextSpan(
                                  text:
                                      '(9420696689 or 9403188935) to activate your profile.'),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                    '1) Xerox Copy of Amount deposited/Screen shot of Payment transfered',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    )),
                                Text('2) Biodata',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    )),
                                Text(
                                    '3) Post Card Size Closeup Photo (Dress code preferably for Boys - Formal Wear and Girls - in Sari or in Panjabi Dress)',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    )),
                                Text(
                                    '4) Relative information, expectations in brief',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    )),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Office Address:',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Text('Veershaiv Vivah Mandal (Zirpe),',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    'Krishna Chambers, Basement Shop No. 5,Pune-Satara Road,Karne Hospital Building, Opp.  Laxminarayan Theater,  SWARGATE, Pune Maharashtra, India 411037',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    )),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Note: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        'Please fill up the complete information so as to increase your profile search better and to receive more Interests again your profile. You must fillup all the information within few days or else your profile will be again deactivated automatically'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Padding(
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
                    child: Text(
                        'What are the types of memberships & what are the charges?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue.shade900,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('We have three types of memberships.',
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'a) A Joint  Member: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff800080))),
                              TextSpan(text: 'To become '),
                              TextSpan(
                                  text: 'Joint  Member ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: 'you have to pay only '),
                              TextSpan(
                                  text: 'Rs. 2500/-',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      '. This includes Rs. 400/- i.e. 80 credit points to view Online Profile contacts information. These credit points are valid and should be utilized within 1 year. If you have used all your credit points within one year then you can request for further credits points. You can send requests and see responses received.'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'b) A Gold Premium Member: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff800080))),
                                TextSpan(text: 'To become '),
                                TextSpan(
                                    text: 'Gold Premium Member ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: 'you have to pay only '),
                                TextSpan(
                                    text: 'Rs. 25000/-',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        '. You have to pay Rs. 5000/- during registration, Rs.10000/- after engagement and Rs. 10000/- after successful marriage. We will provide you personal co-ordination and occasional presence of us for meetings. We will take care for your candidate. We will provide you necessary guidance to you even on our holiday (Monday). This will have all benefits of Joint Member.'),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'c) A Silver Premium Member: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff800080))),
                                TextSpan(text: 'To become '),
                                TextSpan(
                                    text: 'Silver Premium Member ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: 'you have to pay only '),
                                TextSpan(
                                    text: 'Rs. 7500/-',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        '. Your profile will be highlighted on website and magazine published by us. This will have all benefits of Joint Member.'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Padding(
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
                    child: Text(
                        'How to Renew my expired Membership and what are the charges?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue.shade900,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                            'You can contact Veershaiv Vivah Mandal for Membership Renewal.',
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                        Text('For Joint Membership Renewal',
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                        Text(
                            '- Rs. 2000/- if Membership is renewed before expiry',
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                        Text(
                            '- Rs. 2300/- if Membership is renewed within 3 months the membership is expired',
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                        Text(
                            '- Rs. 2100/- if Membership is renewed within 3 to 6 months the membership is expired',
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                        Text(
                            '- Rs. 2500/- if Membership is renewed after 6 months the membership is expired',
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                              'There will be 15 more credit points provided in case member does renewal before expiry i.e. he will get total Rs. 400/- i.e. 80 credit points to view online profile contacts',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Padding(
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
                    child: Text('How do I pay Registration Fees?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue.shade900,
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
                    child: DefaultTabController(
                        length: 4, // length of tabs
                        initialIndex: 0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              TabBar(
                                labelColor: Colors.blue.shade600,
                                unselectedLabelColor: Colors.black,
                                tabs: const [
                                  Tab(text: "Deposit Amount"),
                                  Tab(text: "Online Payment"),
                                  Tab(text: "Money Order"),
                                  Tab(text: "Demand Draft")
                                ],
                              ),
                              Container(
                                height: 300,
                                //height of TabBarView
                                decoration: const BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.black, width: 0.5))),
                                child: TabBarView(
                                  // controller: _tabController,
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child: Text(
                                                "You can pay by online banking by transferring the amount to either of our following banks by the name"),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      color:
                                                          Colors.grey.shade600,
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Mr. Ramling Keshav Zirpe",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    Table(
                                                      border: TableBorder.all(
                                                          color: Colors.black),
                                                      children: const [
                                                        TableRow(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              'Bank name, Branch',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              'A/c No',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              'IFSC Code / MICR Code',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ]),
                                                        TableRow(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'State Bank of India, Dhankawdi'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                '31598129115'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'SBIN0005413 / 411002048'),
                                                          ),
                                                        ]),
                                                        TableRow(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'Central Bank of India, Swarget'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                '3519151133'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'CBIN0280662 / 411016007'),
                                                          ),
                                                        ]),
                                                        TableRow(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'Bank Of Maharashtra, Dhankwadi'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                '20104742549'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'MAHB0000776 / 411014015'),
                                                          ),
                                                        ]),
                                                        TableRow(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'HDFC Bank, Araneshwar'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                '04371160001069'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'HDFC0000359 / 411240011'),
                                                          ),
                                                        ]),
                                                        TableRow(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'ICICI Bank, Shivajinagar'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                '003901211800'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'ICIC00000337 / 411229003'),
                                                          ),
                                                        ]),
                                                        TableRow(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'IDFC First Bank, Bibvewadi'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                '10065861336'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'IDFB0041372'),
                                                          ),
                                                        ])
                                                      ],
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      color:
                                                          Colors.grey.shade600,
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Veershaiv Vivah Mandal",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    Table(
                                                      border: TableBorder.all(
                                                          color: Colors.black),
                                                      children: const [
                                                        TableRow(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'Central Bank of India, Swarget'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                '3338551919'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'CBIN0280662 / 411016007'),
                                                          ),
                                                        ]),
                                                      ],
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      color:
                                                          Colors.grey.shade600,
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Mrs. Renuka Ramling Zirpe",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    Table(
                                                      border: TableBorder.all(
                                                          color: Colors.black),
                                                      children: const [
                                                        TableRow(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'Axis Bank, Sahakar Nagar'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                '35001010032522'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'UTIB0000350 / 411211011'),
                                                          ),
                                                        ]),
                                                        TableRow(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'HDFC Bank, Sahakar Nagar'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                '5010025007884'),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'HDFC0000359'),
                                                          ),
                                                        ]),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child: Text("PayTM No: 9420696689"),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child:
                                                Text("MobiKwik No: 9420696689"),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child:
                                                Text("Google Pay: 9371029775"),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Column(children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 1.0,
                                                          style: BorderStyle
                                                              .solid)),
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: const Text(
                                                      "Payment Gateway using CCAVENUE"),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 1.0,
                                                          style: BorderStyle
                                                              .solid)),
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image.asset(
                                                      "assets/ccav_secure_banner.gif"),
                                                )
                                              ])),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child: Text(
                                                "You can send money order(M.O.) to our office address"),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child: Text(
                                                "Krishna Chembers,Basement Shop No. 5,"),
                                          ),
                                          Text(
                                              "Pune-Satara Road,Near Laxminarayan Theater,"),
                                          Text(
                                              "Near Central Bank of India, SWARGATE,"),
                                          Text(
                                              "Pune-411037, Maharashtra, India"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
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
                                                    'You can send Demand Draft payable at Pune, Maharashtra by the name of '),
                                            TextSpan(
                                                text: '"Mr. Ramling. K. Zirpe"',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ])),
                    // child: DefaultTabController(
                    //   length: 4, // length of tabs
                    //   initialIndex: 0,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.stretch,
                    //     children: [
                    //       const TabBar(
                    //         // controller: _tabController,
                    //         tabs: [
                    //           Tab(text: "Deposit Amount"),
                    //           Tab(text: "Online Payment"),
                    //           Tab(text: "Money Order"),
                    //           Tab(text: "Demand Draft")
                    //         ],
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 10.0),
                    //         child: TabBarView(
                    //           // controller: _tabController,
                    //           children: [
                    //             const Icon(Icons.directions_car),
                    //             Column(
                    //               children: [
                    //                 const Text("PayTM No: 9420696689"),
                    //                 const Padding(
                    //                   padding: EdgeInsets.only(top: 10.0),
                    //                   child: Text("MobiKwik No: 9420696689"),
                    //                 ),
                    //                 const Padding(
                    //                   padding: EdgeInsets.only(top: 10.0),
                    //                   child: Text("Google Pay: 9371029775"),
                    //                 ),
                    //                 Padding(
                    //                     padding: const EdgeInsets.only(top: 10.0),
                    //                     child: Container(
                    //                       child: Row(children: [
                    //                         Container(
                    //                           decoration: BoxDecoration(
                    //                               border: Border.all(
                    //                                   color: Colors.black,
                    //                                   width: 0.5,
                    //                                   style:
                    //                                       BorderStyle.solid)),
                    //                           padding: const EdgeInsets.all(10.0),
                    //                           child: const Text(
                    //                               "Payment Gateway using CCAVENUE"),
                    //                         ),
                    //                         Container(
                    //                           decoration: BoxDecoration(
                    //                               border: Border.all(
                    //                                   color: Colors.black,
                    //                                   width: 0.5,
                    //                                   style:
                    //                                       BorderStyle.solid)),
                    //                           padding: const EdgeInsets.all(10.0),
                    //                           child: Image.asset(
                    //                               "assets/ccav_secure_banner.gif"),
                    //                         )
                    //                       ]),
                    //                     )),
                    //               ],
                    //             ),
                    //             Column(
                    //               children: const [
                    //                 Text(
                    //                     "You can send money order(M.O.) to our office address"),
                    //                 Padding(
                    //                   padding: EdgeInsets.only(top: 10.0),
                    //                   child: Text(
                    //                       "Krishna Chembers,Basement Shop No. 5,"),
                    //                 ),
                    //                 Text(
                    //                     "Pune-Satara Road,Near Laxminarayan Theater,"),
                    //                 Text(
                    //                     "Near Central Bank of India, SWARGATE,"),
                    //                 Text("Pune-411037, Maharashtra, India"),
                    //               ],
                    //             ),
                    //             RichText(
                    //               textAlign: TextAlign.justify,
                    //               text: const TextSpan(
                    //                 style: TextStyle(
                    //                   fontSize: 14.0,
                    //                   color: Colors.black,
                    //                 ),
                    //                 children: <TextSpan>[
                    //                   TextSpan(
                    //                       text:
                    //                           'You can send Demand Draft payable at Pune, Maharashtra by the name of '),
                    //                   TextSpan(
                    //                       text: '"Mr. Ramling. K. Zirpe"',
                    //                       style: TextStyle(
                    //                           fontWeight: FontWeight.bold)),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ),
                ],
              )),
          Padding(
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
                    child: Text(
                        'How to upload my profile photo? How many profile photo I can upload?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue.shade900,
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
                    child: const Text(
                        'After successfull login you can go to "My Profile" page and you can upload your profile Photo. You can upload Maximum up to 6 Profile Photos.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14.0, color: Colors.black)),
                  ),
                ],
              )),
          Padding(
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
                    child: Text('How to search Profile?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue.shade900,
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
                    child: Column(
                      children: [
                        const Text(
                            'To avail this functionality you have to become a paid member. After registration you will get email for your account is active. Just login and After successful login you can search profiles. Search profiles functionality is supported with various search options like Search profiles by Basic search parameters like Profile, Name, Caste, Education, Age, Height etc and Advanced search like Contact City, Native City, Occupation',
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
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
                                        'You will see the profiles of all the candidates.  Press '),
                                TextSpan(
                                    text: 'More Details',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                                TextSpan(
                                    text:
                                        ' to see details about the candidates. You can also view photo(if it is loaded.). Also you can see their contact numbers if Credit is taken to do so. To send a request just press "'),
                                TextSpan(
                                    text: 'Send Request',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                                TextSpan(
                                    text:
                                        '". With this you can get contact with the profile by send them request via email. You can specify your request details.'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Padding(
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
                    child: Text('How do I see Interest Sent/Received?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue.shade900,
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
                    child: const Text(
                        'After successful login you will be redirected to your Home screen where you will see summary of Interest Sent by you and Interests received for your profile. You can go from there to see details',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14.0, color: Colors.black)),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
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
                    child: Text('How to get Help?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue.shade900,
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
                    child: const Text('Please visit our Contact Us page.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14.0, color: Colors.black)),
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
