// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './locator.dart';
import './navigation_service.dart';
import './string_extensions.dart';
import './routing/routing_data.dart';
import 'dart:html';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItem(this.title, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    print(window.location.href);
    // print(Uri.base.path);
    // RouteSettings.of(context);
    List<String> splitUrl = window.location.href.split('/');
    String path = '/' + splitUrl[splitUrl.length - 1];
    print(path);
    Color textColor = ((navigationPath == path) && (navigationPath != '/home'))
        ? Color(0xFFFFFFFF)
        : Color(0xFF7C813F);

    return Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
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
