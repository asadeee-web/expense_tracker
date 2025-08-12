import 'package:expense_tracker/features/onbaording/onboarding_screen.dart';
import 'package:expense_tracker/features/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(fontFamily: "font-regular", brightness: Brightness.dark),
      home: const OnboardingScreen(),
    );
  }
}
