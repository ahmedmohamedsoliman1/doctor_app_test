import 'package:doctor_app_test/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


typedef OnChanged = void Function (String)? ;
typedef Validator = String? Function(String?)? ;

Widget customAppTextField ({
  required OnChanged onChanged ,
  required Validator validator ,
  required String hint ,
  required TextEditingController controller ,
  bool obscure = false
}) {
  return TextFormField(
    onChanged: onChanged,
    validator: validator,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16)
      ) ,
      hintText: hint ,
      hintStyle: const TextStyle(
        color: AppColors.lightGrey ,
      )
    ),
    controller: controller,
    obscureText: obscure,
  );
}