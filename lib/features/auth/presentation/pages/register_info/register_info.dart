import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../bottom_nav_bar.dart';


class RegistrationInfoPage extends StatefulWidget {
  const RegistrationInfoPage({super.key});
  @override
  State<RegistrationInfoPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationInfoPage> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 120.h),
                  Text(
                    "Ro'yxatdan o'tish",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      height: 1.2.h,
                    ),
                  ),
                  SizedBox(height: 60.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Ismingiz",
                      style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: "Ismingizni kiriting",
                      hintStyle: const TextStyle(color: Color(0xFF9296A6)),
                      filled: true,
                      fillColor: const Color(0xFFF8F9FF),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFF4A66D8), width: 2.w),
                      ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                  SizedBox(height: 30.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Familiyangiz",
                      style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    controller: _surnameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: "Familiyangizni kiriting",
                      hintStyle: const TextStyle(color: Color(0xFF9296A6)),
                      filled: true,
                      fillColor: const Color(0xFFF8F9FF),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFF4A66D8), width: 2.w),
                      ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),

                  SizedBox(height: 60.h),

                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: () {
                          final name = _nameController.text.trim();
                          final surname = _surnameController.text.trim();
                          if (name.isEmpty || surname.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Iltimos, barcha maydonlarni to'ldiring")),
                            );
                            return;
                          }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNavBarPage(),
                            ),
                          );
                          print("Muvaffaqiyatli: ${_nameController.text} ${_surnameController.text}");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A66D8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        child: Text(
                          "Ro'yxatdan o'tish",
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Klaviatura uchun joy
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}