import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './routing/route_names.dart';
import './navigation_bar.dart';
import './locator.dart';
import './navigation_service.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
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

class _AboutUsPageState extends State<AboutUsPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireDb = FirebaseFirestore.instance;
  Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    String? uid = auth.currentUser?.uid;
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset('assets/Google@3x.png'),
                onPressed: () {
                  locator<NavigationService>().navigateTo(HomeRoute);
                },
              );
            },
          ),
          title: Text("Hazel", style: TextStyle(color: Colors.white)),
          actions: <Widget>[NaviBar()],
        ),
        body: Center(
            child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: Colors.lime[50], //page background
                ),
                child: ListView(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("About Us",
                                style: TextStyle(
                                    color: Colors.teal[900],
                                    fontSize: 40,
                                    fontFamily: 'Roboto'))),
                      ),
                    ),
                    Container(
                        //What is Hazel?
                        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        height: 300.0,
                        width: 1000.0,
                        color: Colors.transparent,
                        child: Container(
                            margin: EdgeInsets.only(left: 100.0, right: 100.0),
                            decoration: BoxDecoration(
                                color:
                                    Colors.teal[900], //box 1 background color
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Center(
                                child: ListView(children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15.0, left: 15.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("What is Hazel?",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Roboto')),
                                ),
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                            ])))),
                    Container(
                        //Who is 412 Technologies?
                        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        height: 300.0,
                        width: 1000.0,
                        color: Colors.transparent,
                        child: Container(
                            margin: EdgeInsets.only(left: 100.0, right: 100.0),
                            decoration: BoxDecoration(
                                color:
                                    Colors.blue[800], //box 2 background color
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Center(
                                child: ListView(children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15.0, left: 15.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Who is 412 Technologies?",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Roboto')),
                                ),
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                            ])))),
                    Container(
                        //How to Contact Us
                        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        height: 300.0,
                        width: 1000.0,
                        color: Colors.transparent,
                        child: Container(
                            margin: EdgeInsets.only(left: 100.0, right: 100.0),
                            decoration: BoxDecoration(
                                color:
                                    Colors.lime[900], //box 3 background color
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Center(
                                child: ListView(children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15.0, left: 15.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("How to Contact Us",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Roboto')),
                                ),
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                            ])))),
                  ],
                ))));
  }
}
