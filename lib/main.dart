import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

//import 'package:todoapp/controllers/components/conatiner_component.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/views/starting_screens/splash_screen.dart';
//import 'package:todoapp/views/auth_screens/signup_screen.dart';
//import 'package:todoapp/views/starting_screens/splash_screen.dart';

//Waiting Time
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo Application', home: SplashScreen(),
      //ConatinerComponent()

      //RegistrationScreen(),
    );
  }
}
