import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'my_information.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _showFullImage = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                // Blue Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(24.w, 60.h, 24.w, 32.h),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1E3A8A), Color(0xFF22348A)],
                    ),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => _showFullImage = true),
                        child: CircleAvatar(
                          radius: 40.r,
                          backgroundImage: const NetworkImage(
                            'https://randomuser.me/api/portraits/women/44.jpg',
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Aziza Alimova",
                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "+998 88 556 44 15",
                            style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Menu
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                    itemCount: 6,
                    separatorBuilder: (_, __) => Divider(
                      height: 1.h,
                      thickness: 0.5,
                      color: Colors.grey.withOpacity(0.3),
                      indent: 56.w,
                      endIndent: 40.w,
                    ),
                    itemBuilder: (context, index) {
                      final data = [
                        {'icon': 'assets/profile/User.svg', 'title': "Mening ma'lumotlarim"},
                        {'icon': 'assets/profile/Balans.svg', 'title': "Balans"},
                        {'icon': 'assets/profile/translation.svg', 'title': "Til o'zgartirish"},
                        {'icon': 'assets/profile/app_share.svg', 'title': "Ilovni ulashish"},
                        {'icon': 'assets/profile/app_info.svg', 'title': "Ilova haqida"},
                        {'icon': 'assets/profile/Aloqa.svg', 'title': "Aloqa", 'color': Colors.red},
                      ];
                      final item = data[index];
                      return _menuItem(
                        item['icon'] as String,
                        item['title'] as String,
                        color: item['color'] as Color?,
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const MyInformationPage()),
                            );

                          }
                        },
                      );
                    },
                  ),
                ),

                // Tugmalar
                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 30.h),
                  child: Column(
                    children: [
                      _actionButton("Hisobdan chiqish", const Color(0xFFF5F7FF), const Color(0xFF22348A)),
                      SizedBox(height: 16.h),
                      _actionButton("Profilni o'chirish", const Color(0xFFFFF0F0), Colors.red),
                    ],
                  ),
                ),
              ],
            ),

            // Katta rasm + matn (Overlay)
            if (_showFullImage)
              GestureDetector(
                onTap: () => setState(() => _showFullImage = false),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Sarlavha
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                      ),

                      // Katta rasm
                      Container(
                        width: 428.r,
                        height: 240.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4.w),
                          image: const DecorationImage(
                            image: NetworkImage('https://randomuser.me/api/portraits/women/44.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
          ],
        ),

    );
  }

  Widget _menuItem(String assetPath, String title, {Color? color, VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        assetPath,
        width: 26.w,
        height: 26.h,
        colorFilter: ColorFilter.mode(color ?? const Color(0xFF22348A), BlendMode.srcIn),
      ),
      title: Text(title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.chevron_right, color: Colors.black54, size: 28.r),
      onTap: onTap,
    );
  }

  Widget _actionButton(String text, Color bg, Color txtColor) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: bg,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
        child: Text(text, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: txtColor)),
      ),
    );
  }
}