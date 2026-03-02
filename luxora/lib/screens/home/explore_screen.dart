import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: const Center(
        child: Text(
          "Explore Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}