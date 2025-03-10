import 'package:flutter/material.dart';
import 'package:motwakel/widgets/shared_widgets/CustomButton.dart';
import 'package:motwakel/widgets/shared_widgets/CustomImageButton.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/shared_widgets/CustomCardItem.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildUserInfo(),
            _buildOptionsList(context),
            _buildSocialMediaLinks(),
            _buildCustomerService(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("محمود", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("العنوان: مم", style: TextStyle(fontSize: 16, color: Colors.black54)),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.copy, color: Colors.green),
              SizedBox(width: 8),
              Text("كود الحساب: 102003033", style: TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsList(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          CustomCardItem(title: "الإشعارات", icon:Icons.notifications, onTap: () {}),
          CustomCardItem(title: "فواتيرك", icon:Icons.receipt_long, onTap: () {}),
          CustomCardItem(title: "الهدايا", icon:Icons.card_giftcard, onTap: () {}),
          CustomCardItem(title: "السلة", icon: Icons.shopping_cart,decorationcolor: Colors.green,value: "0", onTap: (){}),
          CustomCardItem(title: "المحفظة", icon: Icons.account_balance_wallet,decorationcolor: Colors.orange, value: "0.0", onTap: (){}),
          CustomCardItem(title: "الشكاوي و الإقتراحات", icon: Icons.chat, onTap: (){}),
          CustomCardItem(title: "فروعنا", icon: Icons.location_on, onTap: (){}),
          SizedBox(height: 10),
          CustomButton(text: 'تسجيل الخروج',color: Colors.redAccent, onPressed: (){})

        ],
      ),
    );
  }

  Widget _buildSocialMediaLinks() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(onPressed: (){},assetImage: "assets/images/face_book.png"),
          CustomIconButton(onPressed: (){},assetImage: "assets/images/tiktok.png"),
          CustomIconButton(onPressed: (){},assetImage: "assets/images/whatsapp.png"),
          CustomIconButton(onPressed: (){},assetImage: "assets/images/instagram.png"),
          CustomIconButton(onPressed: (){},assetImage: "assets/images/linkedin.png"),
        ],
      ),
    );
  }



  Widget _buildCustomerService() {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse('tel:15092')),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 5),
          Text(
            'خدمة العملاء',
            style: TextStyle(fontSize: 16, color: Colors.green),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_phone_outlined, color: Colors.green),
              Text('15092', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber),),
              Icon(Icons.local_phone_outlined, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
