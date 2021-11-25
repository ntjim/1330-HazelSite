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
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              width: 380.0,
                                              child: Text(
                                                "Feel empowered to reverse climate change with Hazel",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 35,
                                                    fontFamily: 'Roboto'),
                                                textAlign: TextAlign.center,
                                              ))),
                                      Container(
                                          height: 30.0,
                                          width: 200.0,
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
                                        Text(
                                          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "\n-- Hazel user',
                                          style: TextStyle(
                                              color: Colors.lightGreen[300],
                                              fontSize: 30,
                                              fontFamily: 'Roboto'),
                                          textAlign: TextAlign.center,
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
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [
                                        Text(
                                          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "\n-- Hazel user',
                                          style: TextStyle(
                                              color: Colors.lightGreen[300],
                                              fontSize: 30,
                                              fontFamily: 'Roboto'),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ))))
                      ],
                    )))));
  }
}
