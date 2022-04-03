import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName,
      {Map<String, String>? queryParams}) {
    if (queryParams != null) {
      routeName = Uri(path: routeName, queryParameters: queryParams).toString();
    }
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  // String getUri(String navigationPath) {
  //   return ;
  // }

  void goBack() {
    // might need to be bol except pop() returns void do idk
    return navigatorKey.currentState!.pop();
  }
}
