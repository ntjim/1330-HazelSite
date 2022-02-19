//ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import './public_home.dart';
import './private_home.dart';
import './create_user.dart';
import './nav_bar.dart';

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

// Login form (email & password fields) with validation
class LoginPageForm extends StatefulWidget {
  const LoginPageForm({Key? key}) : super(key: key);

  @override
  _LoginPageFormState createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PrivateHomePage()),
      );
    } on FirebaseAuthException catch (e) {
      //Note: these print statements will not be in production code
      // they are here only for development purposes
      // and will be replaced with errors shown to the user
      // on the log in form
      if (e.code == 'user-not-found') {
        print('No user found for that email');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 40, bottom: 15),
              child: SizedBox(
                  width: 420,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Email Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  ))),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SizedBox(
                  width: 420,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ))),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
              backgroundColor:
                  MaterialStateProperty.all(Colors.lightGreen[400]),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.transparent),
              )),
              fixedSize: MaterialStateProperty.all(const Size(300, 40)),
            ),
            child: Text(
              'Log in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto',
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _signIn();
              }
            },
          ),
        ],
      ),
    );
  }
}

// Login page all together
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
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: navColor,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Hazel", style: TextStyle(color: Colors.white)),
              actions: <Widget>[NavBar()],
            ),
            body: Center(
              child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/sc-riverbank-web.jpg'),
                        fit: BoxFit.cover)),
                child: ListView(
                  children: [
                    Align(
                        alignment: Alignment(0.0, -0.8),
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
                    LoginPageForm(),
                    Align(
                      alignment: Alignment(0.0, -0.85),
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.lightGreen[400]),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.transparent))),
                          fixedSize:
                              MaterialStateProperty.all(const Size(300, 40)),
                        ),
                        child: Text('Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Roboto',
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                      ),
                    ),
                    Spacer(flex: 3),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.transparent))),
                          fixedSize:
                              MaterialStateProperty.all(const Size(400, 30)),
                        ),
                        child: Text('Need Account? Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Roboto',
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateUserPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
