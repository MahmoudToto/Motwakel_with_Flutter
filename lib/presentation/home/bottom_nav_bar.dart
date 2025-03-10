import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal), 

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "الأقسام"),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "العروض"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "المفضلة"),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: "المزيد"),
     /*   BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/accounts.png')),
            label: "الحسابات"),*/
      ],
    );
  }
}
