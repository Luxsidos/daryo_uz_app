import 'package:daryo_uz_app/constants.dart';
import 'package:daryo_uz_app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

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
      home: const HomePage(),
    );
  }
}
