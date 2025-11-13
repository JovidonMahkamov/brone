import 'package:flutter/material.dart';

import 'core/routes/route_generators.dart';
import 'core/routes/route_names.dart';
import 'features/auth/presentation/pages/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context, ) {
    return Builder(
      builder:(builderContext){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Brone',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            fontFamily: 'Roboto',
          ),
          // darkTheme: darkMode,
          home: const SplashPage(),
          onGenerateRoute: AppRoute(context: context).onGenerateRoute,
        );
      },
    );
  }
}
