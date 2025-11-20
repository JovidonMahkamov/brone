import 'package:brone/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'core/di/services_locator.dart';
import 'my_app.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp( MyBlocProvider(child: MyApp()));
}

