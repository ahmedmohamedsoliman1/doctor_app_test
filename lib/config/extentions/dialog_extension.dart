import 'package:doctor_app_test/config/extentions/navigate_extension.dart';
import 'package:doctor_app_test/core/app_colors.dart';
import 'package:doctor_app_test/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension DialogExt on BuildContext {

  Future <void> dialog (BuildContext context , String message , IconData icon , Color color) async{
    return await showDialog(context: context, builder: (context) {
      Future.delayed(const Duration(seconds: 2), () {
       context.pop(context);
      });
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        content: SizedBox(
          width: 200.w,
          height: 150.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Icon(icon, size: 60, color: color,),
              SizedBox(height: 15.h,),
              customText(
                  text: message,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor)
            ],
          ),
        ),
      );
    });
  }
}