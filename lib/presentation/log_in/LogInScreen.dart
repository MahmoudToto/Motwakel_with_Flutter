import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/cubit/auth_cubit.dart';
import '../../widgets/shared_widgets/CustomTextField.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.popAndPushNamed(context, "/HomeScreen");
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red),
              );
            }
          },
          builder: (context, state) {
            return Column(
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
                      const Text(
                        'مرحبا بك 👋',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: phoneController,
                        labelText: 'رقم الهاتف',
                        isPassword: false,
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 10),
                    /*  CustomTextField(
                        controller: passwordController,
                        labelText: 'كلمة المرور',
                        prefixIcon: Icons.lock,
                        suffixIcon: obscureText ? Icons.visibility_off : Icons.visibility,
                        isPassword: true,
                        onTap: () {  },
                      ),*/
                      TextField(
                        controller: passwordController,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20),
                          hintStyle: TextStyle(color: Colors.black),
                          labelText: 'كلمة المرور',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15), // تعديل الزوايا
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green), // لون عند التركيز
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/ResetPasswordScreen");
                          },
                          child: const Text(
                            'نسيت كلمة المرور؟',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: state is AuthLoading
                            ? null
                            : () {
                          BlocProvider.of<AuthCubit>(context).loginWithPhoneAndPassword(
                            phoneController.text,
                            passwordController.text,
                          );
                        },
                        child: state is AuthLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : const Text('تسجيل الدخول'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/SignUpScreen");
                        },
                        child: const Text('إنشاء حساب جديد'),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => launchUrl(Uri.parse('tel:15092')),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 5),
                            const Text(
                              'خدمة العملاء',
                              style: TextStyle(fontSize: 16, color: Colors.green),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.local_phone_outlined, color: Colors.green),
                                Text('15092', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber)),
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
            );
          },
        ),
      ),
    );
  }
}
