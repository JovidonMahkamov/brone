import 'package:brone/features/Add/presentation/pages/add_page.dart';
import 'package:brone/features/Video/presentation/pages/Video.dart';
import 'package:brone/features/report/presentation/pages/report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'features/home/presentation/pages/home_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    ReportPage(),
    AddPage(),
    VideoPage(),
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
    "Bosh sahifa",
    "Hisobot",
    "Xizmat qo'shish",
    "Videolar",
    "Profil",
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          selectedItemColor: Color(0xff22348A),
          unselectedItemColor: Color(0xffB8BFE1),
          showUnselectedLabels: true,
          items: List.generate(_icons.length, (index) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _icons[index],
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  _currentIndex == index ? Color(0xff22348A) : Color(0xffB8BFE1),
                  BlendMode.srcIn,
                ),
              ),
              label: _labels[index],
            );
          }),
        ),
      ),
    );
  }
}
