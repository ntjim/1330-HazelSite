import 'package:flutter/material.dart';
import './public_home.dart';
import './private_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('This is the log in page',
        style: TextStyle(
          color: Colors.blue,
        ));
  }
}
