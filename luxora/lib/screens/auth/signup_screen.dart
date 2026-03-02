import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../core/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? selectedNationality;

  final List<String> nationalities = [
    "Egyptian",
    "American",
    "French",
    "German",
    "Italian",
  ];

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 40),

            // 🔹 Logo (فوق فعلاً)
            Center(
              child: Image.asset(
                "assets/images/logo.jpeg",
                width: 110,
              ),
            ),

           
            const SizedBox(height: 6),

            const Text(
              "Create an account to get started",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            _buildTextField("Full Name", Icons.person),
            const SizedBox(height: 18),

            _buildTextField("Email", Icons.email),
            const SizedBox(height: 18),

            DropdownButtonFormField<String>(
              value: selectedNationality,
              decoration: InputDecoration(
                hintText: "Nationality",
                prefixIcon:
                    const Icon(Icons.flag, color: AppColors.primary),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              items: nationalities.map((String nationality) {
                return DropdownMenuItem<String>(
                  value: nationality,
                  child: Text(nationality),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedNationality = value;
                });
              },
            ),

            const SizedBox(height: 18),

            _buildTextField("Password", Icons.lock, isPassword: true),
            const SizedBox(height: 18),

            _buildTextField(
                "Confirm Password", Icons.lock_outline,
                isPassword: true),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon,
      {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: AppColors.primary),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}