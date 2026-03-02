import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../core/app_colors.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  String selectedLanguage = "English"; // اللغة المختارة افتراضياً
  List<String> languages = [
    "English",
    "Arabic",
    "French",
    "Spanish",
    "German",
    "Italian",
    "Chinese",
    "Japanese",
    "Russian",
    "Portuguese",
    "Hindi",
  ];

  List<String> filteredLanguages = [];

  @override
  void initState() {
    super.initState();
    filteredLanguages = languages;
  }

  void _filterLanguages(String query) {
    setState(() {
      filteredLanguages = languages
          .where((lang) => lang.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Language",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 20),

                // Search bar
                TextField(
                  onChanged: _filterLanguages,
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Languages list
                Expanded(
                  child: ListView.separated(
                    itemCount: filteredLanguages.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1, color: Colors.grey),
                    itemBuilder: (context, index) {
                      String lang = filteredLanguages[index];
                      return ListTile(
                        title: Text(lang),
                        trailing: selectedLanguage == lang
                            ? const Icon(Icons.check, color: AppColors.primary)
                            : null,
                        onTap: () {
                          setState(() {
                            selectedLanguage = lang;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}