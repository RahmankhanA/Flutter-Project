import 'package:flutter/material.dart';
import 'package:news_app/app/core/constant/assets_constant.dart';
import 'package:news_app/app/core/constant/color_constant.dart';
import 'package:news_app/app/core/login/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  bool isPasswordHide = true;

  bool isConfirmPasswordHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 8.0, right: 8.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      child: const Text(
                        "Log In",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                    ),
                  ),
                  SizedBox(height: 250, child: Image.asset(AssetConstan.logo)),
                  TextFormField(
                    controller: emailTextEditingController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordTextEditingController,
                    obscureText: isPasswordHide,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordHide = !isPasswordHide;
                              });
                            },
                            icon: Icon(isPasswordHide
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: confirmPasswordTextEditingController,
                    obscureText: isConfirmPasswordHide,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordHide = !isConfirmPasswordHide;
                              });
                            },
                            icon: Icon(isConfirmPasswordHide
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        hintText: " Confirm Password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.primaryColor,
                          foregroundColor: ColorConstant.secondaryColor,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 50)),
                      onPressed: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
