import 'dart:io';
import 'package:brone/core/routes/route_names.dart';
import 'package:brone/features/Add/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../../bottom_nav_bar.dart';
import '../../../Add/presentation/widgets/elevated_button_widget.dart';

class AddVideoPage extends StatefulWidget {
  const AddVideoPage({super.key});

  @override
  State<AddVideoPage> createState() => _AddVideoPageState();
}

class _AddVideoPageState extends State<AddVideoPage> {
  final ImagePicker _picker = ImagePicker();

  List<XFile> _selectedVideos = [];
  List<File> _thumbnails = [];

  Future<void> _pickVideo() async {
    final XFile? picked = await _picker.pickVideo(source: ImageSource.gallery);

    if (picked != null) {
      final thumbPath = await VideoThumbnail.thumbnailFile(
        video: picked.path,
        imageFormat: ImageFormat.PNG,
        maxHeight: 220,
        quality: 75,
      );

      if (thumbPath != null) {
        setState(() {
          _selectedVideos.add(picked);
          _thumbnails.add(File(thumbPath));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, RouteNames.videoEdit);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Post qo’shish",
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: Color(0xff22348A),
                    dashPattern: [15, 10],
                    strokeWidth: 1,
                    radius: Radius.circular(16),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 325.h,
                    color: const Color(0xFFF7F9FC),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/video/add_video.svg',
                          width: 85.w,
                          height: 85.h,
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          "Rasm yoki videoni yuklang",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Faylning qurlimangizndan tanlang",
                          style: TextStyle(color: Colors.grey[600]),
                        ),

                        SizedBox(height: 16.h),

                        ElevatedButton(
                          onPressed: _pickVideo,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Videoni tanlash",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16.h),
                if (_selectedVideos.isNotEmpty)
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: List.generate(_selectedVideos.length, (index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.file(_thumbnails[index], fit: BoxFit.cover),

                            // Play Icon overlay
                            Center(
                              child: Icon(
                                Icons.play_circle_fill,
                                color: Colors.white,
                                size: 40.sp,
                              ),
                            ),

                            // Delete button
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedVideos.removeAt(index);
                                    _thumbnails.removeAt(index);
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(3),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                SizedBox(height: 20.h),
                TextFiledWidget1(
                  text: "Video haqida yozing",
                  obscureText: false,
                ),
                SizedBox(height: 40.h),
                ElevatedWidget(
                  size: double.infinity,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BottomNavBarPage(initialIndex: 3),
                      ),
                    );
                  },
                  text: 'Davom etish',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
