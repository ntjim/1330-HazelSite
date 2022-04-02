// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import './me_page.dart';
import './app_user.dart';
import './nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
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

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireDb = FirebaseFirestore.instance;
  Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    String? uid = auth.currentUser?.uid;
    // print(auth.currentUser?.uid);
    // print(auth.currentUser?.email);

    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: navColor,
        ),
        home: Scaffold(
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Image.asset('assets/Google@3x.png'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      //Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              title: Text("Hazel", style: TextStyle(color: Colors.white)),
              actions: <Widget>[NavBar()],
            ),
            body: Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('sc-delta-web.jpg'),
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
                          height: 250.0,
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
                                        child: Column(children: [
                                          StreamBuilder(
                                              stream: fireDb
                                                  .collection('users')
                                                  .doc(uid)
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (auth.currentUser != null) {
                                                  if (snapshot.hasError) {
                                                    return CircularProgressIndicator();
                                                  }
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return Container(
                                                        width: 330.0,
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 25.0,
                                                                    bottom:
                                                                        15.0),
                                                            child: Text(
                                                              "Welcome back!",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .green[
                                                                      900],
                                                                  fontSize: 30,
                                                                  fontFamily:
                                                                      'Roboto'),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )));
                                                  }
                                                  return Container(
                                                      width: 330.0,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 25.0,
                                                                  bottom: 15.0),
                                                          child: Text(
                                                            "Welcome back ${snapshot.data!['firstname']}!",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green[900],
                                                                fontSize: 30,
                                                                fontFamily:
                                                                    'Roboto'),
                                                            textAlign: TextAlign
                                                                .center,
                                                          )));
                                                }
                                                return Container(
                                                    width: 330.0,
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 25.0,
                                                                bottom: 15.0),
                                                        child: Text(
                                                          "Reduce your climate anxiety. Start reversing climate change today.",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 30,
                                                              fontFamily:
                                                                  'Roboto'),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )));
                                              }),
                                          StreamBuilder(
                                              stream: fireDb
                                                  .collection('users')
                                                  .doc(uid)
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (auth.currentUser != null) {
                                                  return Container(
                                                      width: 500.0,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10.0,
                                                                bottom: 15.0),
                                                        child: Text(
                                                          "Continue combating your carbon footprint by browsing more projects.",
                                                          style: TextStyle(
                                                              color: Colors
                                                                      .lightGreen[
                                                                  300],
                                                              fontSize: 24,
                                                              fontFamily:
                                                                  'Roboto'),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ));
                                                }
                                                return Container(
                                                    height: 30.0,
                                                    width: 190.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .lightGreen[400],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                    child: OutlinedButton(
                                                        child: const Text(
                                                            'DOWNLOAD APP',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Roboto',
                                                            )),
                                                        onPressed:
                                                            () {} // link to an app store, possibly dynamically
                                                        ));
                                              })
                                        ]),
                                      )
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
