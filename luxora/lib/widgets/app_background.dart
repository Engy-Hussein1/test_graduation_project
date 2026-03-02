import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.asset(
              "assets/images/bg.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          // White overlay
          Container(
            color: Colors.white.withOpacity(0.85),
          ),

          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}