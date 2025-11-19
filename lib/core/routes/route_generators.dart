
import 'package:brone/core/routes/route_names.dart';
import 'package:brone/features/Add/presentation/pages/add_page.dart';
import 'package:brone/features/Add/presentation/pages/general_add_page.dart';
import 'package:brone/features/Add/presentation/pages/map_page.dart';
import 'package:brone/features/Add/presentation/pages/network_page.dart';
import 'package:brone/features/Add/presentation/pages/portfolio_page.dart';
import 'package:brone/features/Add/presentation/pages/save_page.dart';
import 'package:brone/features/Add/presentation/pages/uploadbox_page.dart';
import 'package:brone/features/video/presentation/pages/add_video_page.dart';
import 'package:brone/features/video/presentation/pages/video_edit_page.dart';
import 'package:flutter/material.dart';

import '../../bottom_nav_bar.dart';
class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBarPage());
      case RouteNames.portfolio:
        return MaterialPageRoute(builder: (_) => const PortfolioPage());
      case RouteNames.uploadBox:
        return MaterialPageRoute(builder: (_) => const UploadBox());
      case RouteNames.network:
        return MaterialPageRoute(builder: (_) => const NetworkPage());
      case RouteNames.map:
        return MaterialPageRoute(builder: (_) => const MapPage());
      case RouteNames.save:
        return MaterialPageRoute(builder: (_) => const SavePage());
      case RouteNames.add:
        return MaterialPageRoute(builder: (_) => const AddPage());
      case RouteNames.generalAdd:
        return MaterialPageRoute(builder: (_) => const GeneralAddPage());
      case RouteNames.videoEdit:
        return MaterialPageRoute(builder: (_) => const VideoEditPage());
      case RouteNames.addVideo:
        return MaterialPageRoute(builder: (_) => const AddVideoPage());

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
