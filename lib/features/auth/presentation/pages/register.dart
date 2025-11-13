import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Logo
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/brone_logo.png', // make sure you have it
                      height: 90,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Title
              const Text(
                "Ro’yxatdan o’tish",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Text(
                "Xizmatlardan foydalanish uchun\ntelefon raqamingizni kiriting.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 32),

              // Phone Input Field
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Telefon raqamingiz",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF5F5F5),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 56,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.black12),
                        ),
                      ),
                      child: const Text(
                        "+998",
                        style: TextStyle(
                          fontSize: 16,
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
                        decoration: const InputDecoration(
                          hintText: "00 000-00-00",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        // Ensure input text styling is correct
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 52,
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
                  child: const Text(
                    "Davom etish",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Terms and Privacy
              Text.rich(
                TextSpan(
                  text: "Davom etish orqali siz ",
                  style: const TextStyle(
                    fontSize: 12,
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