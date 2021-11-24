import 'package:flutter/material.dart';
import './private_home.dart';

class PublicHomePage extends StatefulWidget {
  const PublicHomePage({Key? key}) : super(key: key);

  @override
  _PublicHomePageState createState() => _PublicHomePageState();
}

class _PublicHomePageState extends State<PublicHomePage> {
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
