import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/routes/route_names.dart';
import '../widgets/elevated_button_widget.dart';

class UploadBox extends StatefulWidget {
  const UploadBox({super.key});

  @override
  State<UploadBox> createState() => _UploadBoxState();
}

class _UploadBoxState extends State<UploadBox> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _selectedImages = [];

  Future<void> _pickMultipleImages() async {
    final picked = await _picker.pickMultiImage();
    if (picked.isNotEmpty) {
      setState(() {
        _selectedImages.addAll(picked);
      });
    }
  }
  int currentStep = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Text(
                  'Faoliyat joyi rasm va videolari',
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    bool isCompleted = index < currentStep;
                    bool isCurrent = index == currentStep;
                    return Row(
                      children: [
                        Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            color: isCompleted
                                ? Colors.indigo
                                : (isCurrent ? Colors.white : Colors.white),
                            border: Border.all(
                              color: isCompleted
                                  ? Colors.indigo
                                  : (isCurrent
                                        ? Colors.indigo
                                        : Colors.grey.shade400),
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: isCompleted
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : (isCurrent
                                      ? Container(
                                          width: 8.w,
                                          height: 8.h,
                                          decoration: const BoxDecoration(
                                            color: Colors.indigo,
                                            shape: BoxShape.circle,
                                          ),
                                        )
                                      : null),
                          ),
                        ),
                        // Step line
                        if (index != 5)
                          Container(
                            width: 40.w,
                            height: 2.h,
                            color: index < currentStep
                                ? Colors.indigo
                                : Colors.grey.shade400,
                          ),
                      ],
                    );
                  }),
                ),
            SizedBox(height: 20.h,),
            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                color: Color(0xff22348A),
              dashPattern: [15, 10],
              strokeWidth: 1,
                radius: Radius.circular(16),
            ),
              child: Container(
                width: double.infinity,
                height: 180,
                color: const Color(0xFFF7F9FC),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Rasm yoki videoni yuklang",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Faylning qurilmangizdan tanlang",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _pickMultipleImages,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Faylni tanlash",style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),
              const SizedBox(height: 16),
              // GridView orqali tanlangan rasmlar
              if (_selectedImages.isNotEmpty)
          GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: _selectedImages.map((image) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(
                    File(image.path),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImages.remove(image);
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(3),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedWidget(
                      onPressed: () {
                        if (currentStep < 6) currentStep++;
                        Navigator.pushNamed(context, RouteNames.network);
                      },
                      text: 'Davom etish',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
