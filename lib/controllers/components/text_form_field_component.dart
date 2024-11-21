import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors/app_colors.dart';

class TxtFormFieldComponent extends StatelessWidget {
  final String textHint;
  final TextEditingController appController;
  final IconData? appIcons;
  final bool isTextObscure;
  const TxtFormFieldComponent(
      {super.key,
      required this.textHint,
      required this.appController,
      this.appIcons,
      this.isTextObscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.appPrimaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: TextFormField(
          obscureText: isTextObscure,
          controller: appController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: textHint,
            hintStyle: TextStyle(color: AppColors.appWhiteColor),
            prefixIcon: Icon(
              appIcons,
              color: AppColors.appWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
