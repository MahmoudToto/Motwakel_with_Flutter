import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/shared_widgets/CustomTextField.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Image.asset('assets/images/login.png', height: 100),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  'مرحبا بك 👋',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: phoneController,labelText: 'رقم الهاتف', isPassword: false,
                  prefixIcon: Icons.phone, keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: passwordController, labelText: 'كلمة المرور', prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility, isPassword: true, ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/ResetPasswordScreen");
                    },
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.popAndPushNamed(context, "/HomeScreen");
                  },
                  child: Text('تسجيل الدخول'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/SignUpScreen");
                  },
                  child: Text('إنشاء حساب جديد'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
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
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
