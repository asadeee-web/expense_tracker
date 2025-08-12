import 'package:expense_tracker/core/utils/textStyle.dart';
import 'package:expense_tracker/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:smart_ui_kit/widgets/smart_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Expense Tracker", style: style20Bold),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  "Your financial journey starts here. Track, manage, and conquer your expenses with ease.",
                  style: style16,
                ),
              ],
            ),

            Image.asset("assets/images/onboarding2.png"),

            SmartButtonAlt(
              label: "Get Started",
              width: double.infinity,

              onPressed: () {
                Get.off(
                  transition: Transition.fadeIn,
                  duration: Duration(milliseconds: 400),
                  HomeScreen(),
                );
              },
              textColor: Colors.white,

              backgroundColor: Color(0xff1C3B8C),
              fontSize: 16,
              borderRadius: 10,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
