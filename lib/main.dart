// auth_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:motwakel/presentation/log_in/LogInScreen.dart';
import 'core/navigation/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      initialRoute: '/LogInScreen',
      onGenerateRoute: AppRouter.generateRoute,
      home: LogInScreen(),
    );
  }
}
