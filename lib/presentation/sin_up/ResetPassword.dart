import 'package:flutter/material.dart';
import 'package:motwakel/widgets/shared_widgets/CustomTextField.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'تغيير كلمة السر',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 10),
            Directionality(
              textDirection: TextDirection.rtl, // جعل النص وكل العناصر تأخذ اتجاه اليمين
              child:  Text(
                'قم بتغيير كلمة المرور، فقط قم بإدخال رقم الهاتف المسجل مسبقًا ليصلك كود التحقق',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 200),
            Text(
              'كود التحقق',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            Directionality(
              textDirection: TextDirection.rtl, // جعل النص وكل العناصر تأخذ اتجاه اليمين
              child:CustomTextField(
                controller: null, labelText: 'أدخل رقم الهاتف', isPassword: false,
                prefixIcon: (Icons.phone_enabled_outlined),
                keyboardType: TextInputType.phone,
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'التالي',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
