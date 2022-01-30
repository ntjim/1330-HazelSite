// ignore_for_file: prefer_const_constructors

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

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
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

class _MePageState extends State<MePage> {
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
                          color: Color(0xFFFFFFFF),
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
                //////where dis end
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      color: Colors.lime[50], //page background color
                    ),
                    child: ListView(
                      children: [
                        Container(
                            //Me page user info box
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 300.0,
                            width: 1100.0,
                            color: Colors.transparent,
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 100.0, right: 100.0),
                              decoration: BoxDecoration(
                                  color:
                                      Colors.lime[50], //box 1 background color
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Center(
                                            child: Container(
                                                width: 330.0,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 25.0,
                                                      bottom: 15.0,
                                                      left: 60),
                                                  child: CircleAvatar(
                                                    //Profile Avatar
                                                    backgroundImage: AssetImage(
                                                        'assets/Google@3x.png'),
                                                    radius: 50,
                                                  ),
                                                ))),
                                      ),
                                      Container(
                                        //Settings button
                                        padding: EdgeInsets.only(
                                            top: 15.0, right: 15.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.settings_outlined,
                                            ),
                                            iconSize: 20,
                                            color: Colors.grey,
                                            splashColor: Colors.purple,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UserSettings()),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      child: Text(
                                    //For username
                                    "${currentUser?.email}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Roboto'),
                                    textAlign: TextAlign.center,
                                  )),
                                  Container(
                                      child: Text(
                                    //For time joined
                                    "Joined: 2022",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Roboto'),
                                    textAlign: TextAlign.center,
                                  )),
                                  Container(
                                      width: 500.0,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.0, bottom: 15.0),
                                        child: Text(
                                          "1,234",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontFamily: 'Roboto'),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Container(
                                      child: Text(
                                    //For time joined
                                    "Hazel Coins",
                                    style: TextStyle(
                                        color: Colors.green[900],
                                        fontSize: 15,
                                        fontFamily: 'Roboto'),
                                    textAlign: TextAlign.center,
                                  )),
                                  Container(
                                      child: Text(
                                    //For time joined
                                    "Get Coins ->",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lime[600],
                                        fontSize: 18,
                                        fontFamily: 'Roboto'),
                                    textAlign: TextAlign.center,
                                  )),
                                ],
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 350.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.teal[900], //box 2 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 15.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Your Impact",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15.0, left: 15.0),
                                            ),
                                            Text('263',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                    fontFamily: 'Roboto')),
                                            Text(
                                                'Hazel Trees earned \nthis month',
                                                style: TextStyle(
                                                    color: Colors.white,
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
                                            Text('1,394',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                    fontFamily: 'Roboto')),
                                            Text(
                                                'Hazel Trees earned \n to date',
                                                style: TextStyle(
                                                    color: Colors.white,
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
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.arrow_upward_rounded,
                                                  color: Colors.lime[600],
                                                ),
                                                Text('7',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 40,
                                                        fontFamily: 'Roboto')),
                                              ],
                                            ),
                                            Text('vs Last Month',
                                                style: TextStyle(
                                                    color: Colors.white,
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
                                            Text('5',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                    fontFamily: 'Roboto')),
                                            Text('Month Streak',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontFamily: 'Roboto')),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 85.0),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 15.0, bottom: 15.0),
                                        child: TextButton(
                                          //button
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.lime[600]),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    side: BorderSide(
                                                        color: Colors
                                                            .transparent))),
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(300, 40)),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'EARN MORE TREES',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontFamily: 'Roboto'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )))),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 350.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.blue[800], //box 3 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 15.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Community Impact",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text('834',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                    fontFamily: 'Roboto')),
                                            Text(
                                                'New Community \nmembers in the \nlast 30 days',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontFamily: 'Roboto')),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15.0, right: 15.0),
                                            ),
                                            //SizedBox(width: 300.0),
                                            Text('8',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                    fontFamily: 'Roboto')),
                                            Text(
                                                'Number of Friends \n'
                                                "you've"
                                                ' invited to date',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontFamily: 'Roboto')),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 75.0),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                          'The more the merrier. Invite your friends to increase',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: 'Roboto')),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                          'your ' "community's" ' impact.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: 'Roboto')),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 15.0, bottom: 15.0),
                                        child: TextButton(
                                          //button
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.lime[600]),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    side: BorderSide(
                                                        color: Colors
                                                            .transparent))),
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(300, 40)),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'INVITE MORE FRIENDS',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontFamily: 'Roboto'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )))),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 350.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.lime[900], //box 4 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 15.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Projects You Support",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Stack(
                                      children: [
                                        // Container(
                                        //   alignment: Alignment.center,
                                        //   child:
                                        //       Image.asset(
                                        //         'assets/sc-delta-web.jpg',
                                        //         height: 200,
                                        //         width: 200,
                                        //         fit: BoxFit.cover
                                        //       ),
                                        // ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                ' Conservation: Southern Cardamom',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: 'Roboto'),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Learn More',
                                                    style: TextStyle(
                                                        color: Colors.lime[600],
                                                        fontSize: 20,
                                                        fontFamily: 'Roboto'),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_rounded,
                                                    color: Colors.lime[600],
                                                  ),
                                                  Text(
                                                    ' ',
                                                    style: TextStyle(
                                                      color: Colors.lime[600],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        'assets/sc-delta-web.jpg',
                                        //height: 100,
                                        //width: 200,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 15.0, bottom: 15.0),
                                        child: TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.lime[600]),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    side: BorderSide(
                                                        color: Colors
                                                            .transparent))),
                                            fixedSize:
                                                MaterialStateProperty.all(
                                                    const Size(300, 40)),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'SEE ALL PROJECTS',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontFamily: 'Roboto'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))))
                      ],
                    )))));
  }
}
