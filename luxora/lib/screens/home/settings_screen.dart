import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../core/app_colors.dart';
import '../auth/login_screen.dart';
import '../profile/profile_screen.dart';
import 'languages_screen.dart'; // تأكدي إنك عملتي الملف هنا

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 30),

              const CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 40,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Lucas Scott",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                "@lucasscott3",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 40),

              _item(Icons.favorite_border, "Favourite List"),

              // 🔹 Language Item مع فتح صفحة اللغات
              _item(
                Icons.language,
                "Language",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LanguagesScreen(),
                    ),
                  );
                },
              ),

              _item(
                Icons.person_outline,
                "Profile",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.dark_mode_outlined,
                  color: AppColors.primary,
                ),
                title: const Text("Appearance"),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),

              _item(
                Icons.logout,
                "Log out",
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Reusable Settings Item
  static Widget _item(
    IconData icon,
    String title, {
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}