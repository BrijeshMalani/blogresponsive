import 'package:blogresponsive/constant/constants.dart';
import 'package:blogresponsive/views/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyA3uDmE4m4liXz9jLMxK5Y6-CmDXCpabPw",
        authDomain: "holedowebsite.firebaseapp.com",
        appId: "1:113243448035:web:2a73d552d5aa60f0485bd6",
        messagingSenderId: "113243448035",
        projectId: "holedowebsite",
        storageBucket: "holedowebsite.appspot.com",
        measurementId: "G-CVSND3NPHM"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Holedo News Responsive All',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
          bodyText2: TextStyle(color: kBodyTextColor),
          headline5: TextStyle(color: kDarkBlackColor),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
