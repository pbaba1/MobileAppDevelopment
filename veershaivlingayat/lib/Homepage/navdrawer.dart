import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:veershaivlingayat/QuickMenu/interest-sent-recevied.dart';
import 'package:veershaivlingayat/QuickMenu/search-profiles.dart';
import 'package:veershaivlingayat/QuickMenu/shortlisted-blocked.dart';
import 'package:veershaivlingayat/StaticScreens/about-us.dart';
import 'package:veershaivlingayat/StaticScreens/astrology.dart';
import 'package:veershaivlingayat/StaticScreens/contact-us.dart';
import 'package:veershaivlingayat/StaticScreens/faq.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

import '../Login/login.dart';
import 'homepage.dart';

class Navdrawer extends StatefulWidget {
  String currentPage;
  Navdrawer({Key? key, required this.currentPage}) : super(key: key);

  @override
  _NavdrawerState createState() => _NavdrawerState();
}

class _NavdrawerState extends State<Navdrawer> {
  String currentPageRecorded = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user;

  @override
  void initState() {
    super.initState();

    setState(() => currentPageRecorded = widget.currentPage);
    _fetchUserDetails();
  }

  void _fetchUserDetails() {
    auth.authStateChanges().listen((User? u) {
      user = u;
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
            (Route route) => false);
      } else {
        firestore
            .collection('users')
            .doc(user?.uid)
            .get()
            .then((DocumentSnapshot snapshot) => {setState(() {})});
      }
    });
  }

  void navigate(Widget widgetToReturn) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => widgetToReturn),
        (Route route) => false);
  }

  void performAction(String requiredAction) {
    switch (requiredAction) {
      case 'Home':
        widget.currentPage != 'Home'
            ? navigate(Homepage(pageTitle: 'Welcome'))
            : Navigator.pop(context);
        break;
      case 'About Us':
        widget.currentPage != 'About Us'
            ? navigate(AboutUs(pageTitle: 'About Us'))
            : Navigator.pop(context);
        break;
      case 'Contact Us':
        widget.currentPage != 'Contact Us'
            ? navigate(ContactUs(pageTitle: 'Contact Us'))
            : Navigator.pop(context);
        break;
      case 'FAQ':
        widget.currentPage != 'FAQ'
            ? navigate(FAQ(pageTitle: 'Frequently Asked Questions'))
            : Navigator.pop(context);
        break;
      case 'Logout':
        break;
      case 'Astrology':
        widget.currentPage != 'Astrology'
            ? navigate(Astrology(pageTitle: 'Astrology'))
            : Navigator.pop(context);
        break;
      case 'Interest Sent':
        widget.currentPage != 'Interest Sent'
            ? navigate(InterestSentRecevied(pageTitle: 'Interest Sent'))
            : Navigator.pop(context);
        break;
      case 'Search Profiles':
        widget.currentPage != 'Search Profiles'
            ? navigate(SearchProfiles(pageTitle: 'Search Profiles'))
            : Navigator.pop(context);
        break;
      case 'Blocked':
        widget.currentPage != 'Blocked'
            ? navigate(ShortlistedBlocked(pageTitle: 'Blocked'))
            : Navigator.pop(context);
        break;
    }
  }

  Color checkMenuActivation(String fromWhere) {
    Color color = Colors.grey.shade600;
    // if (c.menuSubOptions.contains(fromWhere)) {
    //   setState(() => widget.currentPage = fromWhere);
    // }
    if (widget.currentPage == fromWhere || fromWhere == 'Quick Menu') {
      color = Color(c.appColor);
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: SizedBox(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/banner.jpg'))),
          ),
          ListTile(
            leading:
                Icon(Icons.home, color: checkMenuActivation('Home'), size: 22),
            title: Text(
              'Home',
              style: TextStyle(color: checkMenuActivation('Home')),
            ),
            onTap: () => {performAction('Home')},
          ),
          ListTile(
            leading: Icon(Icons.business_outlined,
                color: checkMenuActivation('About Us'), size: 22),
            title: Text('About Us',
                style: TextStyle(color: checkMenuActivation('About Us'))),
            onTap: () => {performAction('About Us')},
          ),
          // to have another drawer
          ExpansionTile(
            /*  onExpansionChanged: (expanded) {
              if (expanded) {
                setState(() => widget.currentPage = 'Quick Menu');
              } else {
                setState(() => widget.currentPage = currentPageRecorded);
              }
            }, */
            leading: Icon(Icons.menu_book,
                color: c.menuSubOptions.contains(widget.currentPage)
                    ? Color(c.appColor)
                    : Colors.grey.shade600,
                size: 22),
            title: Text('Quick Menu',
                style: TextStyle(
                  color: c.menuSubOptions.contains(widget.currentPage)
                      ? Color(c.appColor)
                      : Colors.grey.shade600,
                )),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTile(
                  leading: Icon(Icons.search,
                      color: checkMenuActivation(c.menuSubOptions[0]),
                      size: 22),
                  title: Text(c.menuSubOptions[0],
                      style: TextStyle(
                          color: checkMenuActivation(c.menuSubOptions[0]))),
                  onTap: () => {performAction(c.menuSubOptions[0])},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTile(
                  leading: Icon(Icons.list,
                      color: checkMenuActivation(c.menuSubOptions[1]),
                      size: 22),
                  title: Text(c.menuSubOptions[1],
                      style: TextStyle(
                          color: checkMenuActivation(c.menuSubOptions[1]))),
                  onTap: () => {performAction(c.menuSubOptions[1])},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        // perform click here
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color: checkMenuActivation(c.menuSubOptions[2]),
                              size: 13,
                            ),
                            Icon(Icons.thumb_down,
                                color: checkMenuActivation(c.menuSubOptions[2]),
                                size: 13),
                          ]),
                    ),
                  ),
                  title: Text(c.menuSubOptions[2],
                      style: TextStyle(
                          color: checkMenuActivation(c.menuSubOptions[2]))),
                  onTap: () => {performAction(c.menuSubOptions[2])},
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15.0),
              //   child: ListTile(
              //     leading: Icon(Icons.people,
              //         color: checkMenuActivation(c.menuSubOptions[3]),
              //         size: 22),
              //     title: Text(c.menuSubOptions[3],
              //         style: TextStyle(
              //             color: checkMenuActivation(c.menuSubOptions[3]))),
              //     onTap: () => {performAction(c.menuSubOptions[3])},
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15.0),
              //   child: ListTile(
              //     leading: Icon(FontAwesomeIcons.starOfDavid,
              //         color: checkMenuActivation(c.menuSubOptions[4]),
              //         size: 22),
              //     title: Text(c.menuSubOptions[4],
              //         style: TextStyle(
              //             color: checkMenuActivation(c.menuSubOptions[4]))),
              //     onTap: () => {performAction(c.menuSubOptions[4])},
              //   ),
              // ),
            ],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.starOfDavid,
                color: checkMenuActivation('Astrology')),
            title: Text('Astrology',
                style: TextStyle(color: checkMenuActivation('Astrology'))),
            onTap: () => {performAction('Astrology')},
          ),
          ListTile(
            leading: Icon(Icons.question_mark_sharp,
                color: checkMenuActivation('FAQ')),
            title: Text('FAQ',
                style: TextStyle(color: checkMenuActivation('FAQ'))),
            onTap: () => {performAction('FAQ')},
          ),
          ListTile(
            leading: Icon(Icons.phone_outlined,
                color: checkMenuActivation('Contact Us')),
            title: Text('Contact Us',
                style: TextStyle(color: checkMenuActivation('Contact Us'))),
            onTap: () => {performAction('Contact Us')},
          ),
          const Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: FlatButton(
              height: 40,
              onPressed: () async {
                await auth.signOut();
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Color(c.appColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
        ],
      ),
    );
  }
}
