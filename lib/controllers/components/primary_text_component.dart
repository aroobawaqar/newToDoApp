import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors/app_colors.dart';

class PrimaryTxtComponent extends StatelessWidget {
  final String appText;
  final double? appTextSize;
  final FontWeight? appTextWeight;
  const PrimaryTxtComponent(
      {super.key,
      required this.appText,
      this.appTextSize = 15,
      this.appTextWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      appText,
      style: TextStyle(
        color: AppColors.appPrimaryColor,
        fontSize: appTextSize,
        fontWeight: appTextWeight,
      ),
    );
  }
}
