import 'package:doctor_app_test/config/extentions/navigate_extension.dart';
import 'package:doctor_app_test/core/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DashBoardProvider extends ChangeNotifier {

  void navigateToLogin (BuildContext context) {
    context.pushReplacement(context , AppRoutes.loginRoute);
  }
}