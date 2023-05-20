import 'package:flutter/material.dart';
import 'package:news_app/app/core/constant/color_constant.dart';
import 'package:news_app/app/core/signup/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorConstant.primaryColor),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home:  SignupScreen(),
    );
  }
}
