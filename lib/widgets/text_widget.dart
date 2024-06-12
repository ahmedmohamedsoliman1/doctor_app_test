import 'package:flutter/cupertino.dart';

Widget customText ({required String text ,
required double fontSize , required FontWeight fontWeight , required Color color ,
double h = 0 , TextAlign textAlign = TextAlign.center}) {
return Text(text , style: TextStyle(
  color: color ,
  fontSize: fontSize ,
  fontWeight: fontWeight ,
  height: h
),
textAlign: textAlign,);
}