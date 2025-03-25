import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  final Function(bool) onOTPVerified;

  OTPScreen({required this.phoneNumber, required this.onOTPVerified});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();

  void _verifyOTP() {
    final enteredOTP = _otpController.text;
    // Replace with actual OTP verification logic
    if (enteredOTP == '1234') {
      widget.onOTPVerified(true);
    } else {
      widget.onOTPVerified(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'تم إرسال الكود إلى ${widget.phoneNumber}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _otpController,
              decoration: InputDecoration(
                labelText: 'أدخل الكود',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: Text('التالي'),
            ),
          ],
        ),
      ),
    );
  }
}
