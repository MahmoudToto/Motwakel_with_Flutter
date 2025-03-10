import 'package:flutter/material.dart';


class CategoriesPadge extends StatefulWidget {
  @override
  _CategoriesPadgeState createState() => _CategoriesPadgeState();
}

class _CategoriesPadgeState extends State<CategoriesPadge> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
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
  {"name": "مكرونة", "image": "https://via.placeholder.com/100"},
  {"name": "عناية المنزل", "image": "https://via.placeholder.com/100"},
  {"name": "أغذية معلبة", "image": "https://via.placeholder.com/100"},
  {"name": "توابل", "image": "https://via.placeholder.com/100"},
  {"name": "سمنات", "image": "https://via.placeholder.com/100"},
  {"name": "بقوليات", "image": "https://via.placeholder.com/100"},
  {"name": "حلوى و شيبسي", "image": "https://via.placeholder.com/100"},
  {"name": "مرقة و خلطات", "image": "https://via.placeholder.com/100"},
  {"name": "حبوب الإفطار", "image": "https://via.placeholder.com/100"},
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