import 'package:flutter/material.dart';
//import 'package:todoapp/constants/app_assets/images.dart';

class ImageComponent extends StatelessWidget {
  final String appImage;
  const ImageComponent({super.key, required this.appImage});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      appImage,
      height: 200,
    );
  }
}
