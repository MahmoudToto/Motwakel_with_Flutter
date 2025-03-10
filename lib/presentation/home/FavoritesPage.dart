import 'package:flutter/material.dart';
import 'package:motwakel/widgets/shared_widgets/CustomTitileText.dart';

class FavoritesPage extends StatelessWidget {
  final List<String> favoriteItems = []; // هنا حط المنتجات لو فيه مفضلة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: favoriteItems.isEmpty
          ? _buildEmptyFavorites()
          : _buildFavoriteList(),
    );
  }

  // تصميم لما مفيش مفضلات
  Widget _buildEmptyFavorites() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/login.png", height: 150), // غير المسار حسب صورتك
          SizedBox(height: 20),
          Text(
            "لا يوجد منتجات مفضلة",
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // تصميم قائمة المفضلات لو فيها منتجات
  Widget _buildFavoriteList() {
    return ListView.builder(
      itemCount: favoriteItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(favoriteItems[index]),
          trailing: Icon(Icons.favorite, color: Colors.red),
        );
      },
    );
  }
}
