import 'package:flutter/material.dart';
import 'package:motwakel/presentation/maps/GoogleMapsPadge.dart';
import 'package:motwakel/presentation/otp/OTPVerificationPadge.dart';
import 'package:motwakel/widgets/shared_widgets/CustomButton.dart';
import 'package:motwakel/widgets/shared_widgets/CustomTitileText.dart';
import 'SinUpPadge.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _currentStep = 0;
  final PageController _pageController = PageController();
  String? _verificationId;
  String?
      _selectedAccountType; // Store selected account type (Store or Consumer)

  void _sendOTP(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verification failed: ${e.message}')),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  void _verifyOTP(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      _registerAccount();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  void _registerAccount() {
    // Collect data based on the selected account type
    Map<String, dynamic> accountData = {
      'accountType': _selectedAccountType,
      // Add other fields based on the selected account type
    };

    // Save accountData to Firebase Firestore or Realtime Database
    // Example: FirebaseFirestore.instance.collection('users').add(accountData);

    Navigator.pushNamed(context, "/HomeScreen");
  }

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
    } else if (_currentStep == 3) {
      Navigator.pop(context);
      Navigator.pushNamed(context, "/HomeScreen");
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
                  buildFormSinUp(),
                  buildFormOTPVerification(),
                  _GoogleMapsPadge(),
                ],
              ),
            ),
            CustomButton(text: 'التالي',
                onPressed: () => _nextStep(),
                /*onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTPVerificationPadge(
                        phoneNumber:
                        '01117561394', // Replace with actual phone number
                        onVerifyOTP: _verifyOTP,
                      ),
                    ),
                  );
                },*/)
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
              backgroundColor:
                  _currentStep >= index ? Colors.green : Colors.grey.shade300,
              radius: 12,
              child: _currentStep > index
                  ? Icon(Icons.check, size: 16, color: Colors.white)
                  : Text('${index + 1}', style: TextStyle(color: Colors.black)),
            ),
            if (index < 2)
              Container(
                  width: 20,
                  height: 2,
                  color: _currentStep > index
                      ? Colors.green
                      : Colors.grey.shade300),
          ],
        );
      }),
    );
  }

  Widget buildFormSinUp() {
    return SinUpPadge(
      onAccountTypeSelected: (type) {
        setState(() {
          _selectedAccountType = type;
        });
      },
      onSendOTP: _sendOTP,
    );
  }

  Widget buildFormOTPVerification() {
    return OTPVerificationPadge(
      phoneNumber: '',
      onVerifyOTP: _verifyOTP,
    );
  }

  Widget _GoogleMapsPadge() {
    return GoogleMapsPadge();
  }
}
