import 'dart:convert';
import 'package:doctor_app_test/config/extentions/dialog_extension.dart';
import 'package:doctor_app_test/config/prefs/prefs.dart';
import 'package:doctor_app_test/config/prefs/prefs_constants.dart';
import 'package:doctor_app_test/core/app_colors.dart';
import 'package:doctor_app_test/features/login/data/repository/impl_repo/impl_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {

  TextEditingController emailController = TextEditingController(text:
  InitPrefs.prefs1.getString(PrefsConstants.email) ?? "") ;
  TextEditingController passwordController = TextEditingController(text:
  InitPrefs.prefs1.getString(PrefsConstants.password) ?? "") ;

  bool checked = false ;

  var formKey = GlobalKey<FormState>();

  bool isLoginLoading = false;

  LoginImplRepo loginImplRepo ;

  LoginProvider ({required this.loginImplRepo});

  void equalCheck (bool value) {
    checked = value ;
    print(value);
    notifyListeners();
  }


  void equalEmail (String input) {
    emailController.text = input ;
    notifyListeners();
  }

  void equalPassword (String input) {
    passwordController.text = input ;
    notifyListeners();
  }

  void login (BuildContext context) async{
  if (formKey.currentState!.validate()){
    isLoginLoading = true ;
    notifyListeners();
    await loginImplRepo.login(email: emailController.text, password: passwordController.text).then((value) async{
      if (value.isRight){
        isLoginLoading = false ;
        notifyListeners();
        String userData = jsonEncode(value.right);
        await InitPrefs.saveString(key: PrefsConstants.userData, value: userData).then((value) async{
          if (value == true) {
            print("data saved");
            context.dialog(context , "Login Successfully" , Icons.person , AppColors.primaryColor);
            if (checked == true) {
              await InitPrefs.prefs1.setString(PrefsConstants.email, emailController.text).then((value) {
                print("email saved");
              });
              await InitPrefs.prefs1.setString(PrefsConstants.password, passwordController.text).then((value) {
                print("password saved");
              });
            }
          }
        });
      }else {
        isLoginLoading = false ;
        notifyListeners();
        context.dialog(context , value.left.message! , Icons.person , Colors.red);
      }
    });
  }
  }
}