import 'package:flutter/material.dart';

import '../../presentation/log_in/LogInScreen.dart';
import '../../presentation/sin_up/ResetPassword.dart';
import '../../presentation/sin_up/SinUpScreen.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/LoginScreen':
        return MaterialPageRoute(builder: (_) => LogInScreen());
      case '/SignUpScreen':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
        case '/ResetPasswordScreen':
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      default:
        return MaterialPageRoute(builder: (_) =>  LogInScreen());
    }
  }
}
