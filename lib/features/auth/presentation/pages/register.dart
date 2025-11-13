import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'otp_verification/verification.dart';

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Clean the new text by removing all non-digit characters
    final newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    final StringBuffer buffer = StringBuffer();

    // Max length for the digits we are formatting (9 digits: 00 000-00-00)
    const maxDigits = 9;

    for (int i = 0; i < newText.length && i < maxDigits; i++) {
      // Add space after 2nd digit (00 )
      if (i == 2) {
        buffer.write(' ');
      }
      // Add hyphen after 5th and 7th digits (00 000-00-00)
      if (i == 5 || i == 7) {
        buffer.write('-');
      }
      buffer.write(newText[i]);
    }

    final formattedText = buffer.toString();

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),

              // Logo
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/brone_logo.png', // make sure you have it
                      height: 90.h,
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),

               SizedBox(height: 40.h),

              // Title
              Text(
                "Ro’yxatdan o’tish",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

               SizedBox(height: 8.h),

              // Subtitle
               Text(
                "Xizmatlardan foydalanish uchun\ntelefon raqamingizni kiriting.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black54,
                  height: 1.4.h,
                ),
              ),

              SizedBox(height: 32.h),

              // Phone Input Field
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Telefon raqamingiz",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF5F5F5),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 70.w,
                      height: 56.h,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.black12),
                        ),
                      ),
                      child: Text(
                        "+998",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        // --- START: Added Formatters ---
                        inputFormatters: [
                          // 9 digits + 3 separators (space and two hyphens) = 12 total characters
                          LengthLimitingTextInputFormatter(12),
                          PhoneInputFormatter(),
                        ],
                        // --- END: Added Formatters ---
                        decoration: InputDecoration(
                          hintText: "00 000-00-00",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                        ),
                        // Ensure input text styling is correct
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => VerificationPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E2D7D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Davom etish",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              Text.rich(
                TextSpan(
                  text: "Davom etish orqali siz ",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black54,
                  ),
                  children: [
                    TextSpan(
                      text: "Foydalanish shartlari ",
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(text: "va "),
                    TextSpan(
                      text: "Maxfiylik siyosati",
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(text: "ga rozilik bildirgan bo’lasiz"),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}