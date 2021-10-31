import 'package:daryo_uz_app/home/home_page.dart';
import 'package:daryo_uz_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _AuthPageState();
}

FirebaseAuth _authUser = FirebaseAuth.instance;

class _AuthPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16.0)),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(18.0),
                      ),
                      child: Text(
                        "Login Page",
                        style: GoogleFonts.comfortaa(
                          color: kPrimaryColor,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      cursorColor: kPrimaryColor,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kPrimaryColor, width: 2.5),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kPrimaryColor, width: 1.5),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        hintText: "Enter the email...",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: TextFormField(
                        cursorColor: kPrimaryColor,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 2.5),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1.5),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          hintText: "Enter the password...",
                        ),
                        validator: (e) {
                          if (e!.length < 8) {
                            return "Enter the full!";
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: kPrimaryColor),
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            await _singUp();
                            setState(() {
                              loading = false;
                            });
                          },
                        ),
                        OutlinedButton(
                          child: const Text(
                            "Sign In",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: kPrimaryColor),
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            await _singIn();
                            setState(() {
                              loading = false;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            loading
                ? Container(
                    color: Colors.black26,
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child:
                          const CircularProgressIndicator(color: Colors.white),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Future _singUp() async {
    try {
      await _authUser.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      if (_authUser.currentUser != null) {
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => const HomePage()),
            (route) => true);
      } else {
        Get.snackbar(
          "Error",
          "Email or password is not current!",
          colorText: kPrimaryColor,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Email or password is not current!",
        colorText: kPrimaryColor,
      );
    }
  }

  Future _singIn() async {
    try {
      await _authUser.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      if (_authUser.currentUser != null) {
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => const HomePage()),
            (route) => true);
      } else {
        Get.snackbar(
          "Error",
          "Email or password is not current!",
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Email or password is not current!",
      );
    }
  }
}
