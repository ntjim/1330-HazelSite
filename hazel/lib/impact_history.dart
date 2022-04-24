// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './routing/route_names.dart';
import './navigation_bar.dart';
import './locator.dart';
import './navigation_service.dart';

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

class ImpactHistory extends StatefulWidget {
  const ImpactHistory({Key? key}) : super(key: key);

  @override
  _ImpactHistoryPageState createState() => _ImpactHistoryPageState();
}

class _ImpactHistoryPageState extends State<ImpactHistory> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireDb = FirebaseFirestore.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    String? uid = auth.currentUser?.uid;
    User? currentUser = auth.currentUser;
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset('Google@3x.png'),
                onPressed: () {
                  locator<NavigationService>().navigateTo(HomeRoute);
                },
              );
            },
          ),
          centerTitle: false,
          title: Text("Hazel", style: TextStyle(color: Colors.white)),
          actions: <Widget>[NaviBar()],
        ),
        body: Center(
            child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: Colors.lime[50], //page background color
                ),
                child: ListView(children: [
                  Container(
                    //Settings page user info box
                    margin: EdgeInsets.only(top: 20.0),
                    height: 284.0,
                    width: 1023.0,
                    color: Colors.transparent,
                    child: Container(
                        margin: EdgeInsets.only(left: 100.0, right: 100.0),
                        decoration: BoxDecoration(
                            color: Colors.lime[50], //box 1 background color
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      //Settings button
                                      padding: EdgeInsets.only(
                                          top: 15.0, right: 15.0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                          ),
                                          iconSize: 20,
                                          color: Colors.grey,
                                          splashColor: Colors.purple,
                                          onPressed: () {
                                            locator<NavigationService>()
                                                .navigateTo(AccountRoute);
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment(-0.07, 0.0),
                                          child: SizedBox(
                                              width: 330.0,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 25.0,
                                                    bottom: 15.0),
                                                child: CircleAvatar(
                                                  //Profile Avatar
                                                  backgroundImage: AssetImage(
                                                      'Google@3x.png'),
                                                  radius: 50,
                                                ),
                                              ))),
                                    ),
                                  ],
                                ),
                                Container(
                                  //Profile name below profile picture
                                  child: Container(
                                      child: StreamBuilder(
                                          stream: fireDb
                                              .collection('users')
                                              .doc(uid)
                                              .snapshots(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<DocumentSnapshot>
                                                  snapshot) {
                                            if (!snapshot.hasData) {
                                              return Container(
                                                  width: 330.0,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5.0,
                                                          bottom: 5.0),
                                                      child: Text(
                                                        "",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .teal[900],
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'Roboto'),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )));
                                            }
                                            return Container(
                                                width: 330.0,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5.0, bottom: 5.0),
                                                    child: Text(
                                                      "${snapshot.data!['firstname']}",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.teal[900],
                                                          fontSize: 15,
                                                          fontFamily: 'Roboto'),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )));
                                          })),
                                ),
                                Container(
                                    child: Text(
                                  "Joined: " +
                                      currentUser!.metadata.creationTime!.year
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Roboto'),
                                  textAlign: TextAlign.center,
                                )),
                              ],
                            ))),
                  ),
                  Container(
                      //Account details + divider
                      margin: EdgeInsets.only(left: 100.0, right: 100.0),
                      child: Column(
                        children: [
                          Text(
                            "Impact History & Additional Statistics",
                            style: TextStyle(
                                color: Colors.teal[900],
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(color: Colors.black),
                          Column(
                            children: [
                              ImpactText(
                                  text: "Current number of Hazel coins: ",
                                  dbVariable: "coinsCurrentAmount",
                                  uid: uid,
                                  fireDb: fireDb),
                              ImpactText(
                                  text: "Hazel coins earned to date: ",
                                  dbVariable: "coinsAllTime",
                                  uid: uid,
                                  fireDb: fireDb),
                              ImpactText(
                                  text:
                                      "Number of Hazel Trees earned this month: ",
                                  dbVariable: "treesThisMonth",
                                  uid: uid,
                                  fireDb: fireDb),
                              Divider(color: Colors.black),
                              ImpactText(
                                  text:
                                      "Number of Hazel Trees earned last month: ",
                                  dbVariable: "lastMonthTree",
                                  uid: uid,
                                  fireDb: fireDb),
                              ImpactText(
                                  text:
                                      "Number of Hazel Trees earned to date: ",
                                  dbVariable: "totalTrees",
                                  uid: uid,
                                  fireDb: fireDb),
                              Divider(color: Colors.black),
                              ImpactText(
                                  text: "Current Project: ",
                                  dbVariable: "selectedProjectTitle",
                                  uid: uid,
                                  fireDb: fireDb),
                            ],
                          ),
                        ],
                      ))
                ]))));
  }
}

class ImpactText extends StatelessWidget {
  final String text;
  final String dbVariable;
  final String? uid;
  final FirebaseFirestore fireDb;

  const ImpactText(
      {required this.text,
      required this.dbVariable,
      required this.uid,
      required this.fireDb});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            child: StreamBuilder(
                stream: fireDb.collection('users').doc(uid).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          text,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto'),
                          textAlign: TextAlign.left,
                        ));
                  }
                  String value = (snapshot.data![dbVariable]).toString();
                  return Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        text + value,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto'),
                        // textAlign:
                        //     TextAlign.left,
                      ));
                })),
        SizedBox(width: 50.0),
      ],
    );
  }
}
