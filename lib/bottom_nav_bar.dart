import 'package:brone/features/Add/presentation/pages/general_add_page.dart';
import 'package:brone/features/report/presentation/pages/report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'features/Video/presentation/pages/shorts_main_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';

class BottomNavBarPage extends StatefulWidget {
  final int initialIndex;
  const BottomNavBarPage({super.key,  this.initialIndex= 0});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _currentIndex = 0;
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // initialIndex dan olamiz
  }

  final List<Widget> pages = [
    HomePage(),
    ReportPage(),
    GeneralAddPage(),
    ShortsMainPage(),
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is int) {
      _currentIndex = args;
    }
  }

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
          backgroundColor: Colors.white,
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
