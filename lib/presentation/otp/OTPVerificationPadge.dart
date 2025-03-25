import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motwakel/widgets/shared_widgets/CustomTitileText.dart';

class OTPVerificationPadge extends StatefulWidget {
  final String phoneNumber;
  final Function(String) onVerifyOTP;

  OTPVerificationPadge({required this.phoneNumber, required this.onVerifyOTP});

  @override
  _OTPVerificationPadgeState createState() => _OTPVerificationPadgeState();
}

class _OTPVerificationPadgeState extends State<OTPVerificationPadge> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  void _nextField(String value, int index) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
  }

  void _resendOTP() {
    // Resend OTP logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP has been resent.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTitileText(
              text: 'كود التحقق',
            ),
            SizedBox(height: 8),
            Text(
              "لقد تم إرسال كود تحقق مكون من 6 أرقام إلى:",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              widget.phoneNumber,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 45,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) => _nextField(value, index),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  widget.onVerifyOTP(_controllers.map((c) => c.text).join()),
              child: Text('تأكيد'),
            ),
            ElevatedButton(
              onPressed: _resendOTP,
              child: Text('إعادة إرسال الكود'),
            ),
          ],
        ),
      ),
    );
  }
}
