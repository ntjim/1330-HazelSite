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
    return OutlinedButton(
        child: const Text('To LoggedIn Home',
            style: TextStyle(
              color: Colors.blue,
            )),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrivateHomePage()),
          );
        });
  }
}
