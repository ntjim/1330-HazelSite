// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import './public_home.dart';
import './me_page.dart';

class PrivateHomePage extends StatefulWidget {
  const PrivateHomePage({Key? key}) : super(key: key);

  @override
  _PrivateHomePageState createState() => _PrivateHomePageState();
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

class _PrivateHomePageState extends State<PrivateHomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? currentUser = auth.currentUser;
    print(auth.currentUser?.email);
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
              actions: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MePage()),
                      );
                    }, //SHOULD TAKE THEM TO ME PAGE WHEN IMPLEMENTED
                    child: const Text("Me",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO COMMUNITY PAGE WHEN IMPLEMENTED
                    child: const Text("Community",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO videos PAGE WHEN IMPLEMENTED
                    child: const Text("Videos",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO COMMUNITY PAGE WHEN IMPLEMENTED
                    child: const Text("Impact",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO projects PAGE WHEN IMPLEMENTED
                    child: const Text("Projects",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO COMMUNITY PAGE WHEN IMPLEMENTED
                    child: const Text("Cart",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed: () {
                      auth.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PublicHomePage()),
                      );
                    },
                    child: const Text("Log Out",
                        style: TextStyle(
                          color: Color(0xFF7C813F),
                        )),
                  ),
                ),
              ],
            ),
            body: Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/sc-delta-web.jpg'),
                            fit: BoxFit.cover)),
                    child: ListView(
                      children: [
                        Align(
                            alignment: Alignment(0.0, -0.9),
                            child: Text('Hazel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 130,
                                    fontFamily: 'Lora'))),
                        Align(
                            alignment: Alignment(0.0, -0.85),
                            child: Text('Reversing Climate Change',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w100))),
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          height: 200.0,
                          width: 400.0,
                          color: Colors.transparent,
                          child: Container(
                              margin:
                                  EdgeInsets.only(left: 100.0, right: 100.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Center(
                                          child: Container(
                                              width: 330.0,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 25.0, bottom: 15.0),
                                                  child: Text(
                                                    "Welcome back ${currentUser?.email}!",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.green[900],
                                                        fontSize: 30,
                                                        fontFamily: 'Roboto'),
                                                    textAlign: TextAlign.center,
                                                  )))),
                                      Container(
                                          width: 500.0,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.0, bottom: 15.0),
                                            child: Text(
                                              "Continue combating your carbon footprint by browsing more projects.",
                                              style: TextStyle(
                                                  color: Colors.lightGreen[300],
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto'),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                    ],
                                  ))),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 200.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            child: Text(
                                              '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "\n-- Hazel user',
                                              style: TextStyle(
                                                  color: Colors.lightGreen[300],
                                                  fontSize: 25,
                                                  fontFamily: 'Roboto'),
                                              textAlign: TextAlign.center,
                                            ))
                                      ],
                                    )))),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 200.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Center(
                                        child: Text("ABOUT US",
                                            style: TextStyle(
                                                color: Colors.green[900],
                                                fontSize: 30,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    ExpansionTile(
                                        title: Text('What is Hazel?',
                                            style: TextStyle(
                                                color: Colors.lightGreen[300],
                                                fontSize: 22,
                                                fontFamily: 'Roboto')),
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 10.0,
                                                  bottom: 10.0),
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                      "An app that allows users to offset their carbon footprint by contributing to projects and have fun while doing so.",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: 'Roboto'))
                                                ],
                                              ))
                                        ]),
                                    ExpansionTile(
                                        title: Text('Why Hazel?',
                                            style: TextStyle(
                                                color: Colors.lightGreen[300],
                                                fontSize: 22,
                                                fontFamily: 'Roboto')),
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 10.0,
                                                  bottom: 10.0),
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                      "No calculators. No guessing. No complicated climate science. Hazel has calculated how much each of us would need to fund to start reversing global carbon levels - and climate change - today.",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: 'Roboto'))
                                                ],
                                              ))
                                        ]),
                                  ],
                                ))))
                      ],
                    )))));
  }
}
