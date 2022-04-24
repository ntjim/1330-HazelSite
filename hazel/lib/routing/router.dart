// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../about_us_page.dart';
import '../change_password_form.dart';
import '../community_page.dart';
import '../create_user.dart';
import '../faq.dart';
import '../home.dart';
import '../impact_cart.dart';
import '../impact_history.dart';
import '../impact_shopping.dart';
import '../login_valid.dart';
import '../main.dart';
import '../me_page.dart';
import '../project_page.dart';
import '../project_search.dart';
import '../reset_password_form.dart';
import './route_names.dart';
import '../string_extensions.dart';
import '../user_account_settings.dart';
import '../user_settings.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name?.getRoutingData;
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage(), settings);
    case LoginRoute:
      return _getPageRoute(LoginPage(), settings);
    case SignUpRoute:
      return _getPageRoute(CreateUserPage(), settings);
    case ProjectSearchRoute:
      return _getPageRoute(ProjectSearch(), settings);
    // TODO: find out why this doesnt route correctly and defaults
    case ProjectDetailRoute:
      var id = int.tryParse(routingData?['id']);
      return _getPageRoute(
          ProjectPage(
            projNum: id as int,
          ),
          settings);
    case MeRoute:
      return _getPageRoute(MePage(), settings);
    case CommunityRoute:
      return _getPageRoute(CommunityPage(), settings);
    case ImpactRoute:
      return _getPageRoute(ImpactShopping(), settings);
    case CartRoute:
      return _getPageRoute(Cart(cartList), settings);
    case AccountRoute:
      return _getPageRoute(UserSettings(), settings);
    case AccountSettingsRoute:
      return _getPageRoute(UserAccountSettingsPage(), settings);
    case ChangePasswordRoute:
      return _getPageRoute(ChangePasswordForm(), settings);
    case ImpactHistoryRoute:
      return _getPageRoute(ImpactHistory(), settings);
    case AboutUsRoute:
      return _getPageRoute(AboutUsPage(), settings);
    case ResetPasswordRoute:
      return _getPageRoute(ResetPasswordForm(), settings);
    case FaqPageRoute:
      return _getPageRoute(FaqPage(), settings);

    default:
      return _getPageRoute(UndefinedView(name: settings.name), settings);
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
