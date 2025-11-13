import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'core/di/services_locator.dart';
import 'my_app.dart';


void main() {
  runApp(MyApp());
}

// Future <void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SharedPreferences.getInstance();
//   await setup();
//
//   runApp(
//       MultiBlocProvider(
//           providers: [
//             BlocProvider(create: (_) => sl<RegisterBloc>()),
//
//           ],
//         child: const MyApp(),
//       ),
//   );
// }
