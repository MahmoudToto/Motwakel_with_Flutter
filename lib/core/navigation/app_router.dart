import 'package:flutter/material.dart';
import 'package:motwakel/presentation/home/HomeScreen.dart';

import '../../presentation/details/DetailsScreen.dart';
import '../../presentation/log_in/LogInScreen.dart';
import '../../presentation/resetPassword/ResetPassword.dart';
import '../../presentation/sin_up/SinUpScreen.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/HomeScreen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        case '/LoginScreen':
        return MaterialPageRoute(builder: (_) => LogInScreen());
      case '/SignUpScreen':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
        case '/ResetPasswordScreen':
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
        case '/DetailsScreen':
        return MaterialPageRoute(builder: (_) => DetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) =>  LogInScreen());
    }
  }
}
