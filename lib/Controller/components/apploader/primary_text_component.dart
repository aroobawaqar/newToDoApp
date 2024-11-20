import 'package:flutter/material.dart';
import 'package:todoapp/Controller/colors/Appcolors.dart';
class PrimaryTextWidget extends StatelessWidget {
  String text;
  double? textSize;
  FontWeight? textWeight;
  Color? appColor;
   PrimaryTextWidget({super.key,required this.text,
   this.textSize=18,
     this.textWeight=FontWeight.bold,
     this.appColor,
   });

  @override
  Widget build(BuildContext context) {
    return  Text(text,style: TextStyle(
      fontSize: textSize,
        fontWeight:textWeight ,
        color: AppColors.appPrimaryColor),);
  }
}
