import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: const Center(
        child: Text(
          "Scan Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}