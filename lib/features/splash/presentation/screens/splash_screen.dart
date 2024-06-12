import 'package:doctor_app_test/core/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  static const String route = AppRoutes.splashRoute ;


  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold());
  }
}
