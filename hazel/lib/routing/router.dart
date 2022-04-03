// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './route_names.dart';
import '../home.dart';
import '../login_valid.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage(), settings);
    case LoginRoute:
      return _getPageRoute(LoginPage(), settings);
    // case EpisodesRoute:
    //   return _getPageRoute(EpisodesView(), settings);
    // case EpisodeDetailsRoute:
    //   return _getPageRoute(EpisodeDetails(), settings);
    default:
      return _getPageRoute(HomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String? routeName;
  _FadeRoute({required this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case HomeRoute:
//       return MaterialPageRoute(builder: (context) => HomePage());
//     case LoginRoute:
//       return MaterialPageRoute(builder: (context) => LoginPage());
//     default:
//       return MaterialPageRoute(builder: (context) => HomePage());
//   }
// }

// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case HomeRoute:
//       return _getPageRoute(HomePage(), settings);
//     case LoginRoute:
//       return _getPageRoute(LoginPage(), settings);
//     case SignUpRoute:
//       return _getPageRoute(EpisodesView(), settings);
//     // case EpisodeDetailsRoute:
//     //   return _getPageRoute(EpisodeDetails(), settings);
//     default:
//       return _getPageRoute(HomePage(), settings);
//   }
// }

// PageRoute _getPageRoute(Widget child, RouteSettings settings) {
//   return _FadeRoute(child: child, routeName: settings.name);
// }

// class _FadeRoute extends PageRouteBuilder {
//   final Widget child;
//   final String routeName;
//   _FadeRoute({this.child, this.routeName})
//       : super(
//           settings: RouteSettings(name: routeName),
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               child,
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) =>
//               FadeTransition(
//             opacity: animation,
//             child: child,
//           ),
//         );
// }
