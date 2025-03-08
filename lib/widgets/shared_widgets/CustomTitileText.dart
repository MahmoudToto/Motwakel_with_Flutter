import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomTitileText extends StatelessWidget {
  final String text;
  final Color? textColor;

  const CustomTitileText({
    Key? key,
    required this.text,
    this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor?? Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}