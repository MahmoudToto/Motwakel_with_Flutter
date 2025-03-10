import 'package:flutter/material.dart';



class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<bool> favorites = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "بن سليمان",
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHorizontalList(),
          Expanded(child: _buildProductList()),
        ],
      ),
    );
  }

  Widget _buildHorizontalList() {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // تنفيذ عند الضغط على العنصر
            },
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center( child:
              Image.asset(
                'assets/images/oil.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/sugar.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("دقيق حواء 1 كجم", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text("21 ج", style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(favorites[index] ? Icons.favorite : Icons.favorite_border, color: favorites[index] ? Colors.red : Colors.grey),
                        onPressed: () {
                          setState(() {
                            favorites[index] = !favorites[index];
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle, color: Colors.green),
                        onPressed: () {
                          // إضافة المنتج إلى السلة
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
        );
      },
    );
  }
}
