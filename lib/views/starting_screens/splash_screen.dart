import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/constants/app_assets/images.dart';
import 'package:todoapp/controllers/components/conatiner_component.dart';
//import 'package:todoapp/constants/colors/app_colors.dart';
import 'package:todoapp/controllers/components/image_component.dart';
import 'package:todoapp/controllers/components/primary_text_component.dart';
import 'package:todoapp/views/auth_screens/signup_screen.dart';
import 'package:todoapp/views/home_screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {
        isLoggedin();
      },
    );
  }
  //*******Apply the concept of One time Login Credential
  //on Splash Screen.
  //1. create a function.
  //2.create a variable with dataType "User."
  //3.User is a class provided by the Firebase Authentication package
  //     that represents the currently authenticated user.
  // 4.? after User indicates that the variable uzer can hold either
  //     an instance of a User object or null.********/

  isLoggedin() {
    User? uzer = FirebaseAuth.instance.currentUser;
    if (uzer == null) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => const RegistrationScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: -5,
            left: -15,
            child: ConatinerComponent(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //const ConatinerComponent(),
                Padding(
                  padding: const EdgeInsets.only(top: 160),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //ImageCompnent--------------------------
                      ImageComponent(appImage: AppImages.splashImage),

                      //Primary Text Component----------------------
                      const PrimaryTxtComponent(
                        appText: 'Get things done with TODO',
                      )

                      // **********Image.asset(
                      //   AppImages.splashImage,
                      //   height: 200,
                      // ),
                      // Text(
                      //   'ToDo App',
                      //   style: TextStyle(
                      //     color: AppColors.appPrimaryColor,
                      //   ),
                      // ),********************
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PrimaryTxtComponent(
                        appText: 'Developed by',
                        appTextWeight: FontWeight.w100,
                      ),
                      PrimaryTxtComponent(
                        appText: 'Arooba Waqar',
                        appTextWeight: FontWeight.w900,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
