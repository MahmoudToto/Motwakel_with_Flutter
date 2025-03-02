import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData?  suffixIcon;
  final bool isPassword;


  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.isPassword,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textAlign: TextAlign.right, // لمحاذاة النص لليمين (العربية)
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.black) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.black) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // تعديل الزوايا
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black), // لون عند التركيز
        ),
      ),
    );
  }
}
