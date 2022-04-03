// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import './locator.dart';
import './navigation_service.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItem(this.title, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40),
      child: TextButton(
        style: style,
        onPressed: () {
          locator<NavigationService>().navigateTo(navigationPath);
        },
        child: Text(title,
            style: TextStyle(
              color: Color(0xFF7C813F),
            )),
      ),
    );

    // return GestureDetector(
    //   onTap: () {
    //     // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
    //     // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL
    //     locator<NavigationService>().navigateTo(navigationPath);
    //   },
    //   child: Text(
    //     title,
    //   ),
    // );
  }
}
