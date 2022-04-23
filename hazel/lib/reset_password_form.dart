// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './routing/route_names.dart';
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

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireDb = FirebaseFirestore.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[50],
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
                  height: 500.0,
                  width: 900.0,
                  color: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.only(left: 80.0, right: 80.0),
                    decoration: BoxDecoration(
                        color: Colors.teal[900],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child:
                                Text("Receive an email to reset your password",
                                    style: TextStyle(
                                      color: Colors.lightGreen[400],
                                      fontSize: 40,
                                      fontFamily: 'Roboto',
                                    ),
                                    textAlign: TextAlign.center),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 50, bottom: 20),
                              child: SizedBox(
                                  width: 420,
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter your email'),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter an email';
                                      }
                                      return null;
                                    },
                                  ))),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.lightGreen[400]),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side:
                                    const BorderSide(color: Colors.transparent),
                              )),
                              fixedSize: MaterialStateProperty.all(
                                  const Size(300, 40)),
                            ),
                            child: const Text(
                              'Send email',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                sendReset(_emailController, context);
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                  ),
                                  iconSize: 20,
                                  color: Colors.grey,
                                  splashColor: Colors.purple,
                                  onPressed: () {
                                    locator<NavigationService>()
                                        .navigateTo(LoginRoute);
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text("Cancel",
                                    style: TextStyle(
                                        color: Colors.lightGreen[400],
                                        fontSize: 20,
                                        fontFamily: 'Roboto')),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: navColor,
      ),
      home: Scaffold(
        backgroundColor: Colors.lime[50],
        body: Center(
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Colors.lime[50],
            ),
            child: ListView(
              children: const [
                ResetPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future sendReset(
    TextEditingController emailController, BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Email sent! Rerouting to login...'),
    ));
    await Future.delayed(Duration(seconds: 5));
    locator<NavigationService>().navigateTo(LoginRoute);
  } on FirebaseAuthException catch (e) {
    // print(e);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        action: SnackBarAction(
          label: 'Hide',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        )));
  }
}
