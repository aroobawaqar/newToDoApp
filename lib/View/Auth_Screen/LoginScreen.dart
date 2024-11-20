import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todoapp/Controller/colors/Appcolors.dart';
import 'package:todoapp/Controller/components/apploader/AppImage.dart';
import 'package:todoapp/Controller/components/apploader/ImageComponent.dart';
import 'package:todoapp/Controller/components/apploader/TextFormField.dart';
import 'package:todoapp/Controller/components/apploader/account_exists_component.dart';
import 'package:todoapp/Controller/components/apploader/apploader.dart';
import 'package:todoapp/Controller/components/apploader/custom_button.dart';
import 'package:todoapp/Controller/components/apploader/primary_text_component.dart';
import 'package:todoapp/View/Auth_Screen/RegistrationScreen.dart';
import 'package:todoapp/View/HomeScreen/HomeScreen.dart';
class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController= TextEditingController() ;
  bool isloading = false;
  Future <void> accountLogin()async{
    isloading = true;
    setState(() {
    });
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password:_passwordController.text.trim())
    .then((value){
    //account created successfully-show snakbar
    Get.snackbar(
      'Succesful',
      'You have successfully Signin to your account',
      backgroundColor:AppColors.appPrimaryColor.withOpacity(0.8),
    );
    isloading=false;
    setState(() {
    });
    Get.snackbar(
      icon:const Icon(
        Icons.error_outline,
        color: Colors.red,
      ),
      'Error',
      'Could not signin to your account',
    );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           PrimaryTextWidget(
             text: 'welcome Back',
             textSize: 20,
             textWeight: FontWeight.w500,
            ),
        SizedBox(
          height: 10,
        ),
            Imagecomponent(image: AppImage.LoginImage),
            SizedBox(
              height: 20,
            ),
            TextFormWidght(hintText: 'Enter Email',
                icon: Icons.email_outlined,
                controller: _emailController),
            TextFormWidght(hintText: 'Enter Password',
                icon: Icons.lock,
                controller: _passwordController),
           //isTextObscure:true,
            SizedBox(
              height: 10,
            ),
            isloading
            ? const Apploader()
                :ButtonComponent(
              buttonText:'Login',
              onbuttonTap:(){
                Homescreen();
                //navigator.push
              }),
          AccountExistsComponent(
           rowText:'Don not have an account?',
           nextScreen:Registrationscreen(),
            rowText2: 'Register',

            ),
      ],
        ),
      ),
    );
  }
}
