import 'dart:convert';
import 'package:doctor_app_test/config/extentions/dialog_extension.dart';
import 'package:doctor_app_test/config/prefs/prefs.dart';
import 'package:doctor_app_test/config/prefs/prefs_constants.dart';
import 'package:doctor_app_test/features/register/data/repository/impl_repo/impl_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class RegisterProvider extends ChangeNotifier {

  RegisterImplRepo registerImplRepo ;


  RegisterProvider ({required this.registerImplRepo});

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController() ;
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String code = "" ;


  var formKey = GlobalKey<FormState>();

  bool isRegisterLoading = false ;

  void equalPhone (String input) {
    phoneController.text = input ;
    notifyListeners();
  }

  void equalCode (String userCode) {
    code = userCode ;
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
  void equalName (String input) {
    nameController.text = input ;
    notifyListeners();
  }
  void equalPasswordConfirm (String input) {
    passwordConfirmationController.text = input ;
    notifyListeners();
  }

  void register (BuildContext context) async {
    if (formKey.currentState!.validate()){
      isRegisterLoading = true ;
      notifyListeners();
      await registerImplRepo.register(
          email: emailController.text,
          password: passwordController.text,
          phone: phoneController.text,
          gender: "0",
          passwordConfirmation: passwordConfirmationController.text,
          name: nameController.text).then((value) async{
            if (value.isRight){
              isRegisterLoading = false ;
              notifyListeners();
              String userData = jsonEncode(value.right);
              await InitPrefs.saveString(key: PrefsConstants.userData, value: userData).then((value) {
                print("data saved");
                context.dialog(context , "Register Successfully" , Icons.person , AppColors.primaryColor );
              });
            }else {
              isRegisterLoading = false ;
              notifyListeners();
              context.dialog(context , value.left.data!.phone![0] + value.left.data!.email![0], Icons.person , Colors.red );
            }
      });

    }
  }
}