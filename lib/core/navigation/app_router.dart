import 'package:flutter/material.dart';

import '../../presentation/log_in/LogIn.dart';
import '../../presentation/sin_up/SinUpScreen.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/LoginScreen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/SignUpScreen':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
    }
  }
}
