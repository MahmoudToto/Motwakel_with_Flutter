import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSlider(),
            _buildSectionTitle("اختصاراتك"),
            _buildShortcuts(context),
            _buildSectionTitle("عروض عشانك"),
            _buildHorizontalList(context, "OfferPage"),
            _buildSectionTitle("الأقسام"),
            _buildGrid(context, categories, "CategoryPage"),
            _buildSectionTitle("الأكثر مبيعًا"),
            _buildHorizontalList(context, "BestSellerPage"),
            _buildBanner(),
            _buildSectionTitle("العلامات التجارية"),
            _buildGrid(context, brands, "BrandPage"),
            _buildSectionTitle("عروض مخصصة لك"),
            _buildHorizontalList(context, "CustomOffersPage"),
            _buildSectionTitle("وصل حديثًا"),
            _buildHorizontalList(context, "NewArrivalsPage"),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: 200,
      color: Colors.green,
      child: Center(child: Text("سلايدر الصور")),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildShortcuts(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildShortcutItem(context, "متابعة الفواتير", Icons.receipt_long, "InvoicesPage"),
        _buildShortcutItem(context, "المفضلة", Icons.favorite, "FavoritesPage"),
        _buildShortcutItem(context, "فروعنا", Icons.store, "BranchesPage"),
      ],
    );
  }

  Widget _buildShortcutItem(BuildContext context, String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.green),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildHorizontalList(BuildContext context, String page) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, page),
            child: Container(
              width: 120,
              margin: EdgeInsets.all(8),
              color: Colors.blue,
              child: Center(child: Text("عرض $index")),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGrid(BuildContext context, List<String> items, String page) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, page),
          child: Card(
            color: Colors.orangeAccent,
            child: Center(child: Text(items[index])),
          ),
        );
      },
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 100,
      margin: EdgeInsets.all(8),
      color: Colors.red,
      child: Center(child: Text("إعلان")),
    );
  }

  final List<String> categories = ["أجبان", "عسل", "منظفات", "معلبات", "عرض الكل"];
  final List<String> brands = ["Wadi Food", "Blu", "Almarai", "حلو الشام", "عرض الكل"];
}
