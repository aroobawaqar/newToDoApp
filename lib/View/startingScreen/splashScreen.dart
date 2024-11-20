import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Controller/colors/Appcolors.dart';
import 'package:todoapp/Controller/components/apploader/AppImage.dart';
//import 'package:todoapp/Controller/components/constant/app_assets/images.dart';
import 'package:todoapp/Controller/components/apploader/ImageComponent.dart';
import 'package:todoapp/Controller/components/apploader/primary_text_component.dart';
import 'package:todoapp/View/Auth_Screen/RegistrationScreen.dart';
class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  //initial state
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4,),(){
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>Registrationscreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:290.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Imagecomponent(image: AppImage.splashImage),
                //  Image.asset(AppImages.splashImage,height:100,),
                PrimaryTextWidget(text: 'Todo App',)
                // Text('Todo app',style: TextStyle(color: AppColors.appPrimaryColor),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column
              (children: [
              PrimaryTextWidget(text: 'Developed By',textWeight: FontWeight.w100,),
              PrimaryTextWidget(text: 'Arooba Waqar',textWeight: FontWeight.w900,),
            ],),
          )
        ],
      ),
      ),
    );
  }
}

