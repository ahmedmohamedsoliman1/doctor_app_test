import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customButton ({
  required VoidCallback onPressed ,
  required Widget child ,
  required Color backGroundColor
}) {
  return ElevatedButton(
    onPressed: onPressed,
  style: ElevatedButton.styleFrom(
    backgroundColor: backGroundColor ,
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    )
  ), child: child ,);
}