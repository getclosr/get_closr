import 'package:flutter/material.dart';
import 'package:get_closr/src/core/app_constants.dart';
import 'package:get_closr/src/ui/views/home.dart';
import 'package:get_closr/src/ui/views/login.dart';
import 'package:get_closr/src/ui/views/test.dart';
// import 'package:get_closr/src/ui/views/test.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case testRoute:
        return MaterialPageRoute(builder: (_) => TestView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
