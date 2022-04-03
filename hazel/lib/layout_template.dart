// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import './locator.dart';
import './navigation_service.dart';
import './routing/router.dart';
import './routing/route_names.dart';
import './navigation_bar.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  const LayoutTemplate({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(
        //     leading: Builder(
        //       builder: (BuildContext context) {
        //         return IconButton(
        //           icon: Image.asset('assets/Google@3x.png'),
        //           onPressed: () {
        //             // Navigator.push(
        //             //   context,
        //             //   MaterialPageRoute(builder: (context) => HomePage()),
        //             // );
        //             //Scaffold.of(context).openDrawer();
        //           },
        //           // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //         );
        //       },
        //     ),
        //     title: Text("Hazel", style: TextStyle(color: Colors.white)),
        //     actions: <Widget>[NavigationBar()],
        //   ),
        //   body:
        Container(
      child: child,
      // ),
    );
    // Column(children: [
    //   NavigationBar(),
    //   Expanded(
    //     child: child,
    //     // Navigator(
    //     //   key: locator<NavigationService>().navigatorKey,
    //     //   onGenerateRoute: generateRoute,
    //     //   initialRoute: HomeRoute,
    //     // ),
    //   )
    // ]);
  }
}
