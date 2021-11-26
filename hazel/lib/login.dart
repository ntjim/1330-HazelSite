// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './private_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        Form(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Text('Log in', style: Theme.of(context).textTheme.headline4),
                              Padding(
                                padding: EdgeInsets.only(left: 700, right: 700, top: 20.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    hintText: 'Username'
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 700, right: 700, top: 8.0, bottom: 8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    hintText: 'Password'
                                  ),
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(Colors.black),
                                  backgroundColor: MaterialStateProperty.all(Colors.lightGreen[400]),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.transparent)
                                    )
                                  ),
                                  fixedSize: MaterialStateProperty.all(const Size(300, 40)),
                                ),
                                child: Text('Log in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Roboto',)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrivateHomePage()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment(0.0, -0.85),
                            child: Text('Forgot Password?',
                                style: TextStyle(
                                    color: Colors.lightGreen[400],
                                    fontSize: 15,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w100))),
                        Align(
                            alignment: Alignment(0.0, -0.85),
                            child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Need Account? ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w100)),
                                    TextSpan(
                                      text: 'Sign Up',
                                      style: TextStyle(
                                          color: Colors.lightGreen[400],
                                          fontSize: 15,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w100))])),)

                      
                      ],
                    )))));
  }
}