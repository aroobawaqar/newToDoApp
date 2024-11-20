import 'package:flutter/material.dart';
import 'package:todoapp/Controller/colors/Appcolors.dart';
class TextFormWidght extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  IconData icon;
   TextFormWidght({super.key,
   required this.hintText,
     required this.icon,
     required this.controller
   });

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.appPrimaryColor,
          borderRadius: BorderRadius.circular(5)
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color:Colors.white),
          prefixIcon: Icon(icon,color:Colors.white),
        ),
      ),

    );
  }
}
