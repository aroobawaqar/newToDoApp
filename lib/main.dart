import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/View/Auth_Screen/LoginScreen.dart';
import 'package:todoapp/View/Auth_Screen/RegistrationScreen.dart';
import 'package:todoapp/View/startingScreen/splashScreen.dart';
import 'package:todoapp/firebase_options.dart';


import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// This should be generated by `flutterfire configure`

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Correct initialization
  );
  runApp(MyApp());
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

    home:splashScreen(),
     // home:Registrationscreen(),
     // home: Loginscreen(),
    );
  }
}

