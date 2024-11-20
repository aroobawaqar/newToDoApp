import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Controller/colors/Appcolors.dart';
import 'package:todoapp/Controller/components/apploader/AppImage.dart';
import 'package:todoapp/Controller/components/apploader/ButtonWidght.dart';
import 'package:todoapp/Controller/components/apploader/TextFormField.dart';
import 'package:todoapp/Controller/components/apploader/apploader.dart';
//import 'package:todoapp/Controller/components/constant/app_assets/images.dart';
import 'package:todoapp/Controller/components/apploader/primary_text_component.dart';
import 'package:todoapp/View/Auth_Screen/LoginScreen.dart';

import '../../Controller/components/apploader/ImageComponent.dart';
class Registrationscreen extends StatefulWidget {
   Registrationscreen({super.key});
  @override
  State<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  bool isloading=false;
  Future<void> login()async{
    isloading=true;

        setState(() {

        });
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password:_passwordController.text.trim()

    ).then((onValue){
      //successfull snackbar
          print('Account created successfully');
      isloading=false;
      setState(() {
      });
        Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context)=>Loginscreen()));

    }).onError((error,value){
      isloading=false;
      setState(() {

      });
      //error snack
          print('Error:$error');
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Imagecomponent(image:AppImage.RegistrationImage),
          const SizedBox(height: 10),
          PrimaryTextWidget(text: 'Register Your Self'),
         TextFormWidght(hintText: 'Enter Your Email', icon: Icons.mail, controller: _emailController),
            TextFormWidght(hintText: 'Enter Your Password', icon: Icons.lock_open, controller: _passwordController),
            SizedBox(height: 20,),
         isloading?
         const Apploader():
         Buttonwidght(text:'SignUp', ontap: (){
              //function calling
              login();
            }),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Already have an account?'),
              SizedBox(width: 3,),
              InkWell(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>Loginscreen()));
                  },
                  child: PrimaryTextWidget(text: 'Login'))
            ],)
            // Container(
            //  height: 40,
             // width: 200,
             // decoration: BoxDecoration(
               // color: AppColors.appPrimaryColor,
                // borderRadius: BorderRadius.circular(100)
             // ),
              // child:const Center(child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
           // )
        ],),
      ),
    );
  }
}

