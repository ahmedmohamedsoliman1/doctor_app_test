import 'package:doctor_app_test/core/app_routes.dart';
import 'package:doctor_app_test/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      initialRoute: SplashScreen.route,
      routes: {
        AppRoutes.splashRoute : (context) => const SplashScreen(),

      },
    );
  }
}
