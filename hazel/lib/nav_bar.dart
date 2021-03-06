// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './login_valid.dart';
import './home.dart';
import './me_page.dart';
import './project_search.dart';
import './impact_shopping.dart';
import './impact_cart.dart';

class NavBar extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    if (auth.currentUser == null) {
      return Row(children: [
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: TextButton(
            style: style,
            onPressed:
                () {},
            child: const Text("Community",
                style: TextStyle(
                  color: Color(0xFF7C813F),
                )),
          ),
        ),
        NavBarText("Projects", (context) => ProjectSearch()),
        NavBarText("Login/Signup", (context) => LoginPage()),
      ]);
    } else {
      // logged in user, so show other navbar
      return Row(
        children: [
          NavBarText("Me", (context) => MePage()),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextButton(
              style: style,
              onPressed: () {},
              child: const Text("Community",
                  style: TextStyle(
                    color: Color(0xFF7C813F),
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImpactShopping()),
                );
              },
              child: const Text("Impact",
                  style: TextStyle(
                    color: Color(0xFF7C813F),
                  )),
            ),
          ),
          NavBarText("Projects", (context) => ProjectSearch()),
          NavBarText("Cart", (context) => Cart(cartList)),
          NavBarText("Log Out", (context) => HomePage()),
        ],
      );
    }
  }
}

class NavBarText extends StatefulWidget {
  final String text;
  final Widget Function(BuildContext) function;
  NavBarText(this.text, this.function);

  @override
  _NavBarText createState() => _NavBarText(text, function);
}

class _NavBarText extends State<NavBarText> {
  String text;
  Widget Function(BuildContext) function;
  _NavBarText(this.text, this.function);

  @override
  Widget build(BuildContext context) {
    ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextButton(
        style: style,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: function));
        },
        child: Text(text,
            style: TextStyle(
              color: Color(0xFF7C813F),
            )),
      ),
    );
  }
}
