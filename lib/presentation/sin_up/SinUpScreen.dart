import 'package:flutter/material.dart';
import 'package:motwakel/presentation/sin_up/GoogleMapsPadge.dart';
import 'package:motwakel/presentation/sin_up/OTPVerificationPadge.dart';
import 'package:motwakel/widgets/shared_widgets/CustomTitileText.dart';
import 'SinUpPadge.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _currentStep = 0;
  final PageController _pageController = PageController();

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });
      _pageController.animateToPage(
        _currentStep,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: CustomTitileText(text: 'إنشاء حساب'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            _buildStepper(),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildFormStore(),
                  _buildFormCustomer(),
                  _GoogleMapsPadge(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('التالي', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Row(
          children: [
            CircleAvatar(
              backgroundColor: _currentStep >= index ? Colors.green : Colors.grey.shade300,
              radius: 12,
              child: _currentStep > index ? Icon(Icons.check, size: 16, color: Colors.white) : Text('${index + 1}', style: TextStyle(color: Colors.black)),
            ),
            if (index < 2) Container(width: 20, height: 2, color: _currentStep > index ? Colors.green : Colors.grey.shade300),
          ],
        );
      }),
    );
  }

  Widget _buildFormStore() {
    return SinUpPadge();
  }

  Widget _buildFormCustomer() {
    return OTPVerificationPadge();
  }

  Widget _GoogleMapsPadge() {
    return GoogleMapsPadge();
  }
}
