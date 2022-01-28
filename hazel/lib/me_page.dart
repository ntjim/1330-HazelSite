// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './private_home.dart';
import './public_home.dart';

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
  @override
   Widget build(BuildContext context) {
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
                    onPressed:
                        () {
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
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        color: Colors.lime[50],    //page background color
                        ),
                    child: ListView(
                      children: [
                        Container(  //Me page user info box
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          height: 284.0,
                          width: 1023.0,
                          color: Colors.transparent,
                          child: Container(
                              margin:
                                  EdgeInsets.only(left: 100.0, right: 100.0),
                              decoration: BoxDecoration(
                                  color: Colors.lime[50],       //box 1 background color
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
                                                  child: CircleAvatar(  //Profile Avatar
                                                    backgroundImage:
                                                          AssetImage('assets/Google@3x.png'),
                                                          radius: 50,
                                                  ),
                                                ))),
                                      Container(
                                        child: Text( //For username
                                                    "Username",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontFamily: 'Roboto'),
                                                    textAlign: TextAlign.center,
                                                  )
                                      ),
                                      Container(
                                        child: Text( //For time joined
                                                    "Joined: 2022",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontFamily: 'Roboto'),
                                                    textAlign: TextAlign.center,
                                                  )
                                      ),
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
                                        child: Text( //For time joined
                                                    "Hazel Coins",
                                                    style: TextStyle(
                                                        color: Colors.green[900],
                                                        fontSize: 15,
                                                        fontFamily: 'Roboto'),
                                                    textAlign: TextAlign.center,
                                                  )
                                      ),
                                      Container(
                                        child: Text( //For time joined
                                                    "Get Coins ->",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.lime[600],
                                                        fontSize: 18,
                                                        fontFamily: 'Roboto'),
                                                    textAlign: TextAlign.center,
                                                  )
                                      ),
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
                                    color: Colors.teal[900],    //box 3 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.0, left: 15.0),
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
                                    )
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
                                    color: Colors.blue[800],    //box 3 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.0, left: 15.0),
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
                                    )
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
                                    color: Colors.lime[900],    //box 4 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.0, left: 15.0),
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
                                    )
                                  ],
                                ))))
                      ],
                    )))));
  }
}
