import 'package:flutter/cupertino.dart';

extension Navigate on BuildContext {
  Future<Object?> pushNamed (BuildContext context , String routeName) async{
    return await Navigator.pushNamed(context, routeName);
  }

  void pop (BuildContext context) async {
    return Navigator.pop(context);
  }

  Future <Object?> pushReplacement (BuildContext context , String routeName) async {
    return Navigator.pushReplacementNamed(context, routeName);
  }

  Future <Object?> pushNamedAndRemoveUntil (BuildContext context , String routeName) async {
    return await Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }
}