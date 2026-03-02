import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../widgets/app_background.dart';
import '../../core/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // 🔹 Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController(); // ✅ NEW

  // 🔹 Displayed Data
  String displayName = "Lucas Scott";
  String username = "@lucasscott3";

  // 🔹 Password Visibility
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  // 🔹 Nationality
  String? selectedNationality = "Egyptian";
  final List<String> nationalities = [
    "Egyptian",
    "American",
    "French",
    "German",
    "Italian",
  ];

  // 🔹 Image Picker
  File? profileImage;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 30),

            const Center(
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Profile Image
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.primary,
                    backgroundImage:
                        profileImage != null ? FileImage(profileImage!) : null,
                    child: profileImage == null
                        ? const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 50,
                          )
                        : null,
                  ),
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 Display Name
            Center(
              child: Text(
                displayName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ✅ USERNAME DYNAMIC
            Center(
              child: Text(
                username,
                style: const TextStyle(color: Colors.grey),
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
                prefixIcon:
                    const Icon(Icons.person, color: AppColors.primary),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ✅ USERNAME FIELD
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                prefixIcon:
                    const Icon(Icons.alternate_email, color: AppColors.primary),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            // 🔹 Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email Address",
                prefixIcon:
                    const Icon(Icons.email, color: AppColors.primary),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            // 🔹 Nationality
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

            // 🔹 Password
            TextField(
              obscureText: hidePassword,
              decoration: InputDecoration(
                hintText: "Create a password",
                prefixIcon:
                    const Icon(Icons.lock, color: AppColors.primary),
                suffixIcon: IconButton(
                  icon: Icon(
                    hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            // 🔹 Confirm Password
            TextField(
              obscureText: hideConfirmPassword,
              decoration: InputDecoration(
                hintText: "Confirm password",
                prefixIcon:
                    const Icon(Icons.lock_outline, color: AppColors.primary),
                suffixIcon: IconButton(
                  icon: Icon(
                    hideConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      hideConfirmPassword = !hideConfirmPassword;
                    });
                  },
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (nameController.text.isNotEmpty) {
                          displayName = nameController.text;
                        }

                        if (usernameController.text.isNotEmpty) {
                          username = "@${usernameController.text}";
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    child: const Text("Save"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}