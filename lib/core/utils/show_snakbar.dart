import 'package:cubit_bloc_demo/core/constants/color_const.dart';
import 'package:flutter/material.dart';



void showSnackBar(BuildContext context, String text,
    {bool needToTranslate = true,
    Color textColor =  ColorConst.whiteColor,
    Color? backgroundColor}) {
  hideSnackBar(context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: backgroundColor?? ColorConst.blackColor.withOpacity(0.7),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
    content: Text(
      text,
      style:TextStyle(color: textColor)/*fontStyleMedium14.copyWith(color: textColor),*/
    ),
  ));
}

void hideSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
}
