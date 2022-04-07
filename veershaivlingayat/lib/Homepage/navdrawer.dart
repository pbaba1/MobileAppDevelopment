import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:veershaivlingayat/StaticScreens/about-us.dart';
import 'package:veershaivlingayat/utils/constants.dart' as c;

import 'homepage.dart';

class Navdrawer extends StatefulWidget {
  String currentPage;
  Navdrawer({Key? key, required this.currentPage}) : super(key: key);

  @override
  _NavdrawerState createState() => _NavdrawerState();
}

class _NavdrawerState extends State<Navdrawer> {
  void navigate(Widget widgetToReturn) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => widgetToReturn),
        (Route route) => false);
    // Widget returnableWidget = ;
    // return widgetToReturn;
  }

  void performAction(String requiredAction) {
    switch (requiredAction) {
      case 'Home':
        widget.currentPage != 'Home'
            ? navigate(Homepage())
            : Navigator.pop(context);
        break;
      case 'About Us':
        widget.currentPage != 'About Us'
            ? navigate(AboutUs())
            : Navigator.pop(context);
        break;
      case 'Contact Us':
        break;
      case 'FAQ':
        break;
      case 'Logout':
        break;
      case 'Astrology':
        break;
      case 'Quick Menu':
        break;
    }
  }

  Color checkMenuActivation(String fromWhere) {
    Color color = Colors.grey.shade600;
    if (widget.currentPage == fromWhere) {
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
            child: Text(
              '',
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('assets/banner.jpg'))),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: checkMenuActivation('Home'),
            ),
            title: Text(
              'Home',
              style: TextStyle(color: checkMenuActivation('Home')),
            ),
            onTap: () => {performAction('Home')},
          ),
          ListTile(
            leading: Icon(Icons.business_outlined,
                color: checkMenuActivation('About Us')),
            title: Text('About Us',
                style: TextStyle(color: checkMenuActivation('About Us'))),
            onTap: () => {performAction('About Us')},
          ),
          // to have another drawer
          ListTile(
            leading:
                Icon(Icons.menu_book, color: checkMenuActivation('Quick Menu')),
            title: Text('Quick Menu',
                style: TextStyle(color: checkMenuActivation('Quick Menu'))),
            onTap: () => {performAction('Quick Menu')},
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
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 15),
            child: FlatButton(
              height: 40,
              onPressed: () {
                print("Logout clicked");
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
