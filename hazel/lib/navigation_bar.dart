// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import './nav_bar_item.dart';
import './routing/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool signedIn = (FirebaseAuth.instance.currentUser != null);
    List<Widget> availableWidgets = <Widget>[];

    if (signedIn) {
      availableWidgets.add(NavBarItem('Me', MeRoute));
      availableWidgets.add(SizedBox(
        width: 10,
      ));
      availableWidgets.add(NavBarItem('Impact', ImpactRoute));
      availableWidgets.add(SizedBox(
        width: 10,
      ));
      availableWidgets.add(NavBarItem('Community', CommunityRoute));
      availableWidgets.add(SizedBox(
        width: 10,
      ));
      availableWidgets.add(NavBarItem('Projects', ProjectSearchRoute));
      availableWidgets.add(SizedBox(
        width: 10,
      ));
      availableWidgets.add(NavBarItem('Cart', CartRoute));
      availableWidgets.add(SizedBox(
        width: 10,
      ));
      availableWidgets.add(NavBarItem('Log Out', HomeRoute));
    } else {
      availableWidgets.add(NavBarItem('Community', CommunityRoute));
      availableWidgets.add(SizedBox(
        width: 10,
      ));
      availableWidgets.add(NavBarItem('Projects', ProjectSearchRoute));
      availableWidgets.add(SizedBox(
        width: 10,
      ));
      availableWidgets.add(NavBarItem('Login', LoginRoute));
    }

    return Container(
      height: 50,
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(mainAxisSize: MainAxisSize.min, children: availableWidgets)
        ],
      ),
    );
  }
}
