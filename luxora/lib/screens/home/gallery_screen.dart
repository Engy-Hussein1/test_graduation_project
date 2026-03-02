import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: const Center(
        child: Text(
          "Gallery Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}