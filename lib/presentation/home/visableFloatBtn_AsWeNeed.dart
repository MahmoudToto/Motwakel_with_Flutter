import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VisableFloatBtn(),
    );
  }
}

class VisableFloatBtn extends StatefulWidget {
  @override
  _VisableFloatBtnState createState() => _VisableFloatBtnState();
}

class _VisableFloatBtnState extends State<VisableFloatBtn> {
  bool _isFabVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        setState(() => _isFabVisible = false);
      } else {
        setState(() => _isFabVisible = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "بن سليمان",
              style: TextStyle(color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "بتدور علي منتج معين؟",
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text("الأقسام", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [BoxShadow(color: Colors.grey[300]!, blurRadius: 3)],
                          ),
                          child: Image.network(categories[index]['image']!, fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(categories[index]['name']!, textAlign: TextAlign.center),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _isFabVisible
          ? FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(Icons.shopping_cart),
      )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "الأقسام"),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "العروض"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "المفضلة"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "المزيد"),
        ],
      ),
    );
  }
}

List<Map<String, String>> categories = [
  {"name": "صلصة و صوصات", "image": "https://via.placeholder.com/100"},
  {"name": "زيوت", "image": "https://via.placeholder.com/100"},
  {"name": "سكر و دقيق و أرز", "image": "https://via.placeholder.com/100"},
  {"name": "أجبان", "image": "https://via.placeholder.com/100"},
  {"name": "عسل و مربي", "image": "https://via.placeholder.com/100"},
  {"name": "حلويات", "image": "https://via.placeholder.com/100"},
  {"name": "مكرونة", "image": "https://via.placeholder.com/100"},
  {"name": "عناية المنزل", "image": "https://via.placeholder.com/100"},
  {"name": "أغذية معلبة", "image": "https://via.placeholder.com/100"},
  {"name": "توابل", "image": "https://via.placeholder.com/100"},
  {"name": "سمنات", "image": "https://via.placeholder.com/100"},
  {"name": "بقوليات", "image": "https://via.placeholder.com/100"},
  {"name": "حلوى و شيبسي", "image": "https://via.placeholder.com/100"},
  {"name": "مرقة و خلطات", "image": "https://via.placeholder.com/100"},
  {"name": "حبوب الإفطار", "image": "https://via.placeholder.com/100"},
];
