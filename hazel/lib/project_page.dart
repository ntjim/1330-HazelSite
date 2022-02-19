import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import './private_home.dart';
import './public_home.dart';
import './user_settings.dart';
import './me_page.dart';
import './nav_bar.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

Map<int, Color> color = {
  50: Color.fromRGBO(179, 180, 61, .1),
  100: Color.fromRGBO(179, 180, 61, .2),
  200: Color.fromRGBO(179, 180, 61, .3),
  300: Color.fromRGBO(179, 180, 61, .4),
  400: Color.fromRGBO(179, 180, 61, .5),
  500: Color.fromRGBO(179, 180, 61, .6),
  600: Color.fromRGBO(179, 180, 61, .7),
  700: Color.fromRGBO(179, 180, 61, .8),
  800: Color.fromRGBO(179, 180, 61, .9),
  900: Color.fromRGBO(179, 180, 61, 1),
};

MaterialColor navColor = MaterialColor(0xFFB3B43D, color);

class _ProjectPageState extends State<ProjectPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? currentUser = auth.currentUser;
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: navColor,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Hazel", style: TextStyle(color: Colors.white)),
              actions: <Widget>[NavBar()],
            ),
            body: Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/projectpageimage.png'),
                            fit: BoxFit.cover)),
                    child: ListView(children: [
                      Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          height: 400.0,
                          width: 1100.0,
                          color: Colors.transparent,
                          child: Container(
                            margin: EdgeInsets.only(left: 10.0, right: 10.0),
                            height: 400.0,
                            width: 1100.0,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Align(
                                alignment: Alignment(0.0, -0.85),
                                child: Text('Project 1 Name',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w100))),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          height: 400.0,
                          width: 1100.0,
                          color: Colors.transparent,
                          child: Container(
                              margin: EdgeInsets.only(left: 10.0, right: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Center(
                                  child: ListView(children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.0, left: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Impact Highlights",
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontSize: 20,
                                            fontFamily: 'Roboto')),
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 15.0, left: 15.0),
                                          ),
                                          Text('1',
                                              style: TextStyle(
                                                  color: Colors.deepOrange,
                                                  fontSize: 40,
                                                  fontFamily: 'Roboto')),
                                          Text('NO \nPOVERTY',
                                              style: TextStyle(
                                                  color: Colors.deepOrange,
                                                  fontSize: 15,
                                                  fontFamily: 'Roboto')),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 15.0, left: 15.0),
                                          ),
                                          Text('4',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 40,
                                                  fontFamily: 'Roboto')),
                                          Text('QUALITY \nEDUCATION',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 15,
                                                  fontFamily: 'Roboto')),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 15.0, left: 15.0),
                                          ),
                                          Text('9',
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 40,
                                                  fontFamily: 'Roboto')),
                                          Text(
                                              'INDUSTRY, INNOVATION \nAND INFRASTRUCTURE',
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 15,
                                                  fontFamily: 'Roboto')),
                                        ],
                                      )
                                    ]),
                              ]))))
                    ])))));
  }
}
