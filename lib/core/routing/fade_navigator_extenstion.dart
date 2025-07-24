import 'package:flutter/material.dart';
import 'routing.dart';

extension FadeNavigator on BuildContext {
  Future<T?> pushReplacementFade<T extends Object?>(String routeName) {
    final route = Routing.onGenerateRoute(RouteSettings(name: routeName));
    if (route is MaterialPageRoute) {
      final page = route.builder(this);
      return Navigator.of(this).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, animation, __) => page,
          settings: RouteSettings(name: routeName),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      );
    }
    return Future.value(null);
  }
}
