import 'package:flutter/material.dart';
import 'package:motwakel/presentation/log_in/LogInScreen.dart';
import 'package:motwakel/presentation/sin_up/ResetPassword.dart';
import 'package:motwakel/presentation/sin_up/SinUpScreen.dart';


import 'bottom_nav_bar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  int  _selectedIndex = 0;

  final List<Widget> _pages = [
    LogInScreen(),
    ResetPasswordScreen(),
    SignUpScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
