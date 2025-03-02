// auth_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:motwakel/presentation/log_in/LogIn.dart';

import 'core/navigation/app_router.dart';
// import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  child: MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('ar'),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/HomeScreen',
      onGenerateRoute: AppRouter.generateRoute,
      home: LoginScreen(),
    );
  }
}
