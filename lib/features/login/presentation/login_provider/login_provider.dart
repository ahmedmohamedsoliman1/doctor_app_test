import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {

  TextEditingController emailController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController() ;

  bool checked = false ;

  void equalCheck (bool value) {
    checked = value ;
    print(value);
    notifyListeners();
  }
}