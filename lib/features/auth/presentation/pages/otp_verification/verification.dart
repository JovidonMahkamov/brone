import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import '../register_info/register_info.dart';

// Import your RegistrationPage here

class VerificationPage extends StatefulWidget {
  final String phoneNumber;
  const VerificationPage({super.key, this.phoneNumber = "+998 99 529 07 77"});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  static const int _otpLength = 5;

  late List<TextEditingController> _otpControllers;
  late List<FocusNode> _focusNodes;

  Timer? _timer;
  int _secondsRemaining = 56;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _otpControllers = List.generate(_otpLength, (_) => TextEditingController());
    _focusNodes = List.generate(_otpLength, (_) => FocusNode());
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) controller.dispose();
    for (var node in _focusNodes) node.dispose();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = 56;
      _canResend = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void _resendCode() {
    if (_canResend) {
      print('Resending code to ${widget.phoneNumber}');
      _startTimer();
      // You can add a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Yangi kod yuborildi!")),
      );
    }
  }

  void _onOtpChange(String value, int index) {
    if (value.length == 1 && index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    // Auto-submit when all 5 digits are filled
    if (_otpControllers.every((c) => c.text.isNotEmpty)) {
      _verifyAndProceed();
    }
  }

  void _verifyAndProceed() {
    String otp = _otpControllers.map((c) => c.text).join();
    print('OTP entered: $otp');

    // Simulate API call success (in real app, await API response)
    Future.delayed(const Duration(milliseconds: 500), () {
      // Navigate to RegistrationPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const RegistrationInfoPage(), // Your page
        ),
      );
    });
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 60.w,
      height: 60.h,
      child: TextFormField(
        controller: _otpControllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF1E2D7D), width: 2.w),
          ),
        ),
        style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        onChanged: (value) => _onOtpChange(value, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Text(
                  "Tasdiqlash kodini\nkiriting",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 16.h),
                Text.rich(
                  TextSpan(
                    text: "Tasdiqlash kodi ",
                    style: TextStyle(fontSize: 14.sp, color: Color(0xFF757C9A)),
                    children: [
                      TextSpan(
                        text: widget.phoneNumber,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const TextSpan(text: " raqamiga yuborildi"),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_otpLength, _buildOtpBox),
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Qaytadan yuborish",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: _canResend ? const Color(0xFF1E2D7D) : Colors.black54,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: _resendCode,
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _canResend ? const Color(0xFF1E2D7D) : Colors.black12,
                          ),
                        ),
                        child: Text(
                          _canResend ? "OK" : "$_secondsRemaining",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: _canResend ? const Color(0xFF1E2D7D) : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: _otpControllers.every((c) => c.text.isNotEmpty)
                        ? _verifyAndProceed
                        : null, // Disable if not full
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E2D7D),
                      disabledBackgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      "Tasdiqlash",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}