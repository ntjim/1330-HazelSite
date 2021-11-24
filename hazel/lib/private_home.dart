import 'package:flutter/material.dart';
import './public_home.dart';

class PrivateHomePage extends StatefulWidget {
  const PrivateHomePage({Key? key}) : super(key: key);

  @override
  _PrivateHomePageState createState() => _PrivateHomePageState();
}

class _PrivateHomePageState extends State<PrivateHomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: OutlinedButton(
        child: const Text('To LoggedOut Home',
            style: TextStyle(
              color: Colors.blue,
            )),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PublicHomePage()),
          );
        },
      ),
    );
  }
}
