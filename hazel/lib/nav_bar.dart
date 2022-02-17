import 'package:flutter/material.dart';
import './login_valid.dart';
import './public_home.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Row(children: [
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
          onPressed: () {}, //SHOULD TAKE THEM TO videos PAGE WHEN IMPLEMENTED
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
          onPressed: () {}, //SHOULD TAKE THEM TO projects PAGE WHEN IMPLEMENTED
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
    ]);
  }
}
