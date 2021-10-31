import 'package:daryo_uz_app/auth/login_page.dart';
import 'package:daryo_uz_app/constants.dart';
import 'package:daryo_uz_app/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final FirebaseAuth authUser = FirebaseAuth.instance;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daryo uz app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: kPrimaryBackgroundColor,
        textTheme: GoogleFonts.comfortaaTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          bodyText1: GoogleFonts.comfortaa(color: kPrimaryColor),
          bodyText2: GoogleFonts.comfortaa(color: kPrimaryColor),
        ),
      ),
      home: authUser.currentUser == null ? const LoginPage() : const HomePage(),
    );
  }
}
