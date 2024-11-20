import 'package:flutter/material.dart';
import 'package:todoapp/Controller/colors/Appcolors.dart';
class Buttonwidght extends StatelessWidget {
  String text;
  VoidCallback ontap;
   Buttonwidght({super.key,
     required this. text, required this.ontap
   });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 40,
          width: 200,
        decoration: BoxDecoration(
          color: AppColors.appPrimaryColor,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Center(child: Text(text,style: TextStyle(color: Colors.purple),),),
      ),
    );
  }
}
