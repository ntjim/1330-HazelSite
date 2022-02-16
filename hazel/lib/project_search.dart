// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import './private_home.dart';
import './public_home.dart';
import 'login_valid.dart';
import './me_page.dart';
import './user_settings.dart';

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


class ProjectSearch extends StatefulWidget {
  const ProjectSearch({Key? key}) : super(key: key);

  @override
  _ProjectSearchState createState() => _ProjectSearchState();
}

class _ProjectSearchState extends State<ProjectSearch> {
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectSearch()),
                      );
                    }, //SHOULD TAKE THEM TO projects PAGE WHEN IMPLEMENTED
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text("Login/Signup",
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
                      image: AssetImage('assets/boatfilter.png'),
                      fit: BoxFit.cover)),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment(0.0, -1.0),
                    child: Text('Projects',
                        style: TextStyle(
                            color: Color(0xFFF9F8F1),
                            fontSize: 70,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600))
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                    height: 60.0,
                    width: 100.0,
                    color: Colors.transparent,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF9F8F1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                          hintText: 'Search projects'),
                      )
                    )
                  ),

                  Align(
                    alignment: Alignment(0.95, 0.0),
                    child: TextButton( 
                      onPressed: () {}, // should expand into search filters when pressed
                      child: const Text('Add Search Filters',
                        style: TextStyle(
                        color: Color(0xFFF9F8F1),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w200,)),
                      ),
                  ),

                  Container(
                    margin: EdgeInsets.all(20.0),
                    height: 215.0,
                    width: 270.0,
                    color: Colors.transparent,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0E346D),
                          borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                    child: Text('Project 1 Name',
                                      style: TextStyle(
                                        color: Color(0xFFF9F8F1),
                                        fontSize: 42, 
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,),
                                    ),
                                   
                                   // Favorite button (still need to fill with right color & link to favorites)
                                    Ink(
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFB9C24D), // not showing up ??? 
                                        shape: CircleBorder()),
                                      
                                        child: IconButton(
                                        icon: const Icon(Icons.add),
                                        color: Colors.white,
                                        onPressed: () {}, ),
                                    ),
                                  ],
                                ),
                                
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                                      child: Text('Project description, info, etc...',
                                        style: TextStyle(
                                          color: Color(0xFFF9F8F1),
                                          fontSize: 16, 
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400),
                                        )
                                  )
                                ),

                                TextButton(
                                  onPressed: () {}, // should go to individual project page when pressed
                                    child: const Text('LEARN MORE ->',
                                      style: TextStyle(
                                        color: Color(0xFFB9C24D),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,),
                                      textAlign: TextAlign.left,)
                                
                                ),
                              ]
                          )
                        )
                    )
                  ),
                 
                  Container(
                    margin: EdgeInsets.all(20.0),
                    height: 215.0,
                    width: 270.0,
                    color: Colors.transparent,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0E346D),
                          borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                    child: Text('Project 2 Name',
                                      style: TextStyle(
                                        color: Color(0xFFF9F8F1),
                                        fontSize: 42, 
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,),
                                    ),

                                    // Favorite button (still need to fill with right color & link to favorites)
                                    Ink(
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFB9C24D),
                                        shape: CircleBorder()),
                                      
                                        child: IconButton(
                                        icon: const Icon(Icons.add),
                                        color: Colors.white,
                                        onPressed: () {}, ),
                                    ),
                                  ],
                                ),
                                
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                                      child: Text('Project description, info, etc...',
                                        style: TextStyle(
                                          color: Color(0xFFF9F8F1),
                                          fontSize: 16, 
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400),
                                        )
                                  )
                                ),

                                TextButton(
                                  onPressed: () {}, // should go to individual project page when pressed
                                    child: const Text('LEARN MORE ->',
                                      style: TextStyle(
                                        color: Color(0xFFB9C24D),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,),
                                      textAlign: TextAlign.left,)
                                ),
                              ]
                          )
                        )
                    )
                  ),

                  Container(
                    margin: EdgeInsets.all(20.0),
                    height: 215.0,
                    width: 270.0,
                    color: Colors.transparent,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0E346D),
                          borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                    child: Text('Project 3 Name',
                                      style: TextStyle(
                                        color: Color(0xFFF9F8F1),
                                        fontSize: 42, 
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,),
                                    ),

                                    // Favorite button (still need to fill with right color & link to favorites)
                                    Ink(
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFB9C24D),
                                        shape: CircleBorder()),
                                      
                                        child: IconButton(
                                        icon: const Icon(Icons.add),
                                        color: Colors.white,
                                        onPressed: () {}, ),
                                    ),
                                  ],
                                ),
                                
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                                      child: Text('Project description, info, etc...',
                                        style: TextStyle(
                                          color: Color(0xFFF9F8F1),
                                          fontSize: 16, 
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400),
                                        )
                                  )
                                ),

                                TextButton(
                                  onPressed: () {}, // should go to individual project page when pressed
                                    child: const Text('LEARN MORE ->',
                                      style: TextStyle(
                                        color: Color(0xFFB9C24D),
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,),
                                      textAlign: TextAlign.left,)
                                
                                ),
                              ]
                          )
                        )
                    )
                  ),
                  ])),
        )
      )
    );
  }
}
