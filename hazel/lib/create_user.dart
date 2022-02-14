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
import './login_valid.dart';

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
class CreateUserPageForm extends StatefulWidget {
  const CreateUserPageForm({Key? key}) : super(key: key);

  @override
  _CreateUserPageFormState createState() => _CreateUserPageFormState();
}

class _CreateUserPageFormState extends State<CreateUserPageForm> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  Future<void> _createUser() async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      User? user = result.user;

      if (user != null) {
        await db.collection('users').doc(user.uid).set({
          'coinsAllTime': 0,
          'coinsCurrentAmount': 0,
          'consecutiveMonths': 0,
          'createtimestamp': DateTime.now().millisecondsSinceEpoch,
          // 'firstname': _firstNameController.text,
          'lastMonthTree': 0,
          // 'lastname': _lastNameController.text,
          'lastwritetimestamp': DateTime.now().millisecondsSinceEpoch,
          'preMonthOfPurchase': DateTime.now(),
          'selectedProjectId': '',
          'selectedProjectTitle': '',
          'selectedprojectnumber': 0,
          'totalMonths': 0,
          'totalTrees': 0,
          'treesThisMonth': 0,
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('weak password');
      } else if (e.code == 'email-already-in-use') {
        print('email already in use');
      }
    } catch (e) {
      print(e);
    }
    _signIn();
  }

  Future<void> _signIn() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
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

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PrivateHomePage()),
    );
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
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SizedBox(
                  width: 420,
                  child: TextFormField(
                    controller: _confirmPass,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Confirm Password'),
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
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
              'Create Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto',
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _createUser();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => PrivateHomePage()));
              }
            },
          ),
        ],
      ),
    );
  }
}

// CreateUser page all together
class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
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
                    CreateUserPageForm(),
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
                        child: Text('Back to Login',
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
                  ],
                ),
              ),
            )));
  }
}
