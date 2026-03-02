import 'dart:async';
import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../core/app_colors.dart';
import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // ⏳ استنى 3 ثواني وبعدين روح على Login
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.jpeg", // غيري الاسم لو مختلف
              width: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              "Let The Ancient Walls Speak",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}