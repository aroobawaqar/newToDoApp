import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors/app_colors.dart';

class ConatinerComponent extends StatelessWidget {
  const ConatinerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 90,
          width: 160,
          decoration: BoxDecoration(
            color: AppColors.appPrimaryColor.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
              // topLeft: Radius.circular(200),
              // topRight: Radius.circular(200),
            ),
          ),
        ),
        Container(
          height: 160,
          width: 90,
          decoration: BoxDecoration(
            color: AppColors.appPrimaryColor.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
              //bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
              //topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}
