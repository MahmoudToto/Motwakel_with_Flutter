/*
// auth_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> login(String phone, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _auth.signInWithEmailAndPassword(
        email: "$phone@domain.com", // Firebase يتطلب بريد إلكتروني، يمكن تحويل الرقم إلى بريد وهمي
        password: password,
      );
      print("تم تسجيل الدخول بنجاح");
    } catch (e) {
      print("خطأ في تسجيل الدخول: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
*/
