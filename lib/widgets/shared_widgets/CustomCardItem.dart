import 'package:flutter/material.dart';

class CustomCardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? value;
  final Color? decorationcolor;

  final VoidCallback onTap;

  const CustomCardItem({
    Key? key,
    required this.title,
    required this.icon,
    this.decorationcolor,
    this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: onTap,
      trailing: value != null
          ? Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: decorationcolor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(value!, style: TextStyle(color: Colors.white, fontSize: 14)),
      )
          : null, // إذا لم يتم تمرير value، لن يظهر العنصر
    );
  }
}

