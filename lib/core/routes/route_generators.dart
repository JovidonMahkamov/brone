import 'package:brone/core/routes/route_names.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/otp_verification/verification.dart';
import '../../features/auth/presentation/pages/register.dart';
import '../../features/auth/presentation/pages/register_info/register_info.dart';
import '../../features/auth/presentation/pages/splash_screen.dart';
class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case RouteNames.verification:
        return MaterialPageRoute(builder: (_) => const VerificationPage());
      case RouteNames.registerInfo:
        return MaterialPageRoute(builder: (_) => const RegistrationInfoPage());

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
