import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX

import 'package:medicalapp/views/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Gunakan GetMaterialApp
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}