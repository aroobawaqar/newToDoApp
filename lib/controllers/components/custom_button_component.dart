import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors/app_colors.dart';

class ButtonComponent extends StatelessWidget {
  final String buttonText;
  final VoidCallback onbuttonTap;
  const ButtonComponent(
      {super.key, required this.buttonText, required this.onbuttonTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onbuttonTap,
      child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            color: AppColors.appPrimaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(color: AppColors.appWhiteColor, fontSize: 12),
            ),
          )),
    );
  }
}
