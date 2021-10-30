import 'package:daryo_uz_app/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daryo uz app',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
