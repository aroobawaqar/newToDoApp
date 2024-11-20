import 'package:flutter/material.dart';
class Imagecomponent extends StatelessWidget {
  String image;
   Imagecomponent({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return   Image.asset(image,height:200,);
  }
}
