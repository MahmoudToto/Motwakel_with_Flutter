import 'package:flutter/material.dart';
import 'package:motwakel/presentation/home/CategoriesPadge.dart';
import 'package:motwakel/presentation/home/FavoritesPage.dart';
import 'package:motwakel/presentation/home/HomePadge.dart';
import 'package:motwakel/presentation/home/MorePage.dart';
import 'package:motwakel/presentation/home/OffersPadge.dart';
import 'bottom_nav_bar.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  int  _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CategoriesPadge(),
    OffersPadge(),
    FavoritesPage(),
    MorePage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.qr_code_scanner, color: Colors.black54),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "بتدور علي منتج معين؟",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ),
                    Icon(Icons.search, color: Colors.black54),
                  ],
                ),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/login.png', height: 40 , width: 100,),
              ),
            ),
          ),

      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(Icons.shopping_cart),
      )
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
