import 'dart:async';
import 'package:doctor_app_test/config/extentions/navigate_extension.dart';
import 'package:doctor_app_test/core/app_routes.dart';
import 'package:flutter/cupertino.dart';

class SplashProvider extends ChangeNotifier {

  void navigateToDashBoard (BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      context.pushReplacement(context , AppRoutes.dashboardRoute);
    });
  }
}