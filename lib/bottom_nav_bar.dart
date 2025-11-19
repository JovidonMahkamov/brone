
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'features/profile/profile.dart';


class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _currentIndex = 4;

  final List<Widget> _pages = [
    Center(child: Text("Bosh sahifa")),
    Center(child: Text("Hisobot")),
    Center(child: Text("Xizmat qo'shish")),
    Center(child: Text("Videolar")),
    ProfilePage(),
  ];

  final List<String> _icons = [
    'assets/bottom_nav_bar/Home.svg',
    'assets/bottom_nav_bar/Report.svg',
    'assets/bottom_nav_bar/Add.svg',
    'assets/bottom_nav_bar/Video.svg',
    'assets/bottom_nav_bar/Profile.svg',
  ];

  final List<String> _labels = [
    "Asosiy", "Hisobot", "Xizmat qo'shish", "Videolar", "Profil"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        selectedItemColor: Color(0xFF22348A),
        unselectedItemColor: Color(0xFFB8BFE1),
        showUnselectedLabels: true,
        items: List.generate(5, (i) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _icons[i],
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              _currentIndex == i ? Color(0xFF22348A) : Color(0xFFB8BFE1),
              BlendMode.srcIn,
            ),
          ),
          label: _labels[i],
        )),
      ),
    );
  }
}