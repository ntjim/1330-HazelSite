// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './login.dart';

class PublicHomePage extends StatefulWidget {
  const PublicHomePage({Key? key}) : super(key: key);

  @override
  _PublicHomePageState createState() => _PublicHomePageState();
}

class _PublicHomePageState extends State<PublicHomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Lora'),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Hazel"),
              actions: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO COMMUNITY PAGE WHEN IMPLEMENTED
                    child: const Text("Community"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO videos PAGE WHEN IMPLEMENTED
                    child: const Text("Videos"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                    style: style,
                    onPressed:
                        () {}, //SHOULD TAKE THEM TO projects PAGE WHEN IMPLEMENTED
                    child: const Text("Projects"),
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
                    child: const Text("Login/Signup"),
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
                                                      top: 15.0, bottom: 15.0),
                                                  child: Text(
                                                    "Reduce your climate anxiety. Start reversing climate change today.",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 30,
                                                        fontFamily: 'Roboto'),
                                                    textAlign: TextAlign.center,
                                                  )))),
                                      Container(
                                          height: 30.0,
                                          width: 190.0,
                                          decoration: BoxDecoration(
                                              color: Colors.lightGreen[400],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          child: OutlinedButton(
                                              child: const Text('DOWNLOAD APP',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: 'Roboto',
                                                  )),
                                              onPressed:
                                                  () {} // link to an app store, possibly dynamically
                                              ))
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
