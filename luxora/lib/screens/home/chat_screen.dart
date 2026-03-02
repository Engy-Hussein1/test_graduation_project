import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: const Center(
        child: Text(
          "Chat Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}