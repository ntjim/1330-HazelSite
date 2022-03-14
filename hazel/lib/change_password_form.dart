import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hazel/user_settings.dart';
import 'package:provider/provider.dart';

import './user_account_settings.dart';

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

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireDb = FirebaseFirestore.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

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
                  //green box
                  constraints: BoxConstraints.expand(),
                  margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
                  height: 500.0,
                  width: 900.0,
                  color: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.only(left: 80.0, right: 80.0),
                    decoration: BoxDecoration(
                        color: Colors.teal[900], //box 2 color
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Text("Change Password",
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
                                    controller: _newPasswordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter a New Password'),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a password';
                                      }
                                      return null;
                                    },
                                  ))),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(
                                  width: 420,
                                  child: TextFormField(
                                    controller: _confirmPass,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(),
                                        hintText: 'Confirm New Password'),
                                    validator: (value) {
                                      if (value !=
                                          _newPasswordController.text) {
                                        return 'Passwords do not match';
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
                              'Update Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _changePassword(_newPasswordController.text);
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserAccountSettingsPage()),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text("Go back",
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
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
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
              color: Colors.lime[50], //page background color
            ),
            child: ListView(
              children: const [
                ChangePasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _changePassword(String newPassword) {
  FirebaseAuth.instance.currentUser!
      .updatePassword(newPassword)
      .then((_) {})
      .catchError((error) {
    //May occur if the user isn't found or if the password input was incorrrect.
  });
}
