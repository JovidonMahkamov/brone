
import 'package:brone/core/routes/route_names.dart';
import 'package:brone/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../../bottom_nav_bar.dart';
class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBarPage());

      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
