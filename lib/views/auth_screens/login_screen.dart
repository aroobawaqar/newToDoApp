import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:todoapp/constants/app_assets/images.dart';
import 'package:todoapp/constants/colors/app_colors.dart';
import 'package:todoapp/controllers/components/account_exists_component.dart';
import 'package:todoapp/controllers/components/apploader/apploader.dart';
import 'package:todoapp/controllers/components/conatiner_component.dart';
import 'package:todoapp/controllers/components/custom_button_component.dart';
import 'package:todoapp/controllers/components/image_component.dart';
import 'package:todoapp/controllers/components/primary_text_component.dart';
import 'package:todoapp/controllers/components/text_form_field_component.dart';
import 'package:todoapp/views/auth_screens/signup_screen.dart';
import 'package:todoapp/views/home_screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passowrdController = TextEditingController();
  bool isLoading = false;

  Future<void> accountLogin() async {
    isLoading = true;
    setState(() {});

    //----Firebase----User Authorization------Command-------------

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passowrdController.text.trim())
        .then((value) {
      //Account created successfully-----Show Snackbar-------------
      Get.snackbar(
        'Successful',
        'You have successfully Signin to your account',
        backgroundColor: AppColors.appPrimaryColor.withOpacity(0.8),
      );
      isLoading = false;
      setState(() {});
      //If login successful the move to HomeScreen-------------------
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
      //Get.to(() => const HomeScreen());
    }).onError((error, value) {
      isLoading = false;
      setState(() {});
      Get.snackbar(
        icon: const Icon(
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned(
            top: -5,
            left: -15,
            child: ConatinerComponent(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PrimaryTxtComponent(
                  appText: 'WelCome Back!',
                  appTextSize: 20,
                  appTextWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 10,
                ),
                ImageComponent(appImage: AppImages.loginImage),
                const SizedBox(
                  height: 20,
                ),
                TxtFormFieldComponent(
                    textHint: 'Enter Email',
                    appController: _emailController,
                    appIcons: Icons.email_outlined),
                TxtFormFieldComponent(
                  textHint: 'Enter Password',
                  appController: _passowrdController,
                  appIcons: Icons.lock,
                  isTextObscure: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                isLoading
                    ? const AppLoader()
                    : ButtonComponent(
                        buttonText: 'Login',
                        onbuttonTap: () {
                          accountLogin();
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //     builder: (context) => const HomeScreen(),
                          //   ),
                          // );
                          // Get.to(() => const HomeScreen());
                        }),
                const AccountExists(
                  rowText: 'Don\'t have an account?',
                  nextScreen: RegistrationScreen(),
                  rowText2: 'Register',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
