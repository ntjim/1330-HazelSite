// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './locator.dart';
import './navigation_service.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItem(this.title, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    List<String> splitUrl = window.location.href.split('/');
    String path = '/' + splitUrl[splitUrl.length - 1];
    Color textColor = ((navigationPath == path) && (navigationPath != '/home'))
        ? Color(0xFFFFFFFF)
        : Color(0xFF7C813F);

    EdgeInsets itemMargin = EdgeInsets.only(left: 40);
    if (title == 'Log Out' || title == 'Login') {
      itemMargin = EdgeInsets.only(left: 40, right: 40);
    }
    return Container(
        margin: itemMargin,
        child: TextButton(
          style: style,
          onPressed: () {
            if (title == 'Log Out') {
              auth.signOut();
            }
            locator<NavigationService>().navigateTo(navigationPath);
          },
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ));
  }
}
