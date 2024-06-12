import 'package:doctor_app_test/config/extentions/dialog_extension.dart';
import 'package:doctor_app_test/config/extentions/navigate_extension.dart';
import 'package:doctor_app_test/features/login/data/repository/impl_repo/impl_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {

  TextEditingController emailController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController() ;

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
    await loginImplRepo.login(email: emailController.text, password: passwordController.text).then((value) {
      if (value.isRight){
        isLoginLoading = false ;
        notifyListeners();
        context.dialog(context , value.right.message!);
      }else {
        isLoginLoading = false ;
        notifyListeners();
        context.dialog(context , value.left.message!);
      }
    });
  }
  }
}