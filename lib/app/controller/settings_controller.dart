import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/shared_pref_helper.dart'; // Adjust import as needed

class SettingsController extends GetxController {
  final selectedLanguage = "English".obs;
  final languages = ["English", "Arabic"];

  // Text Editing Controllers
  final stationNameController = TextEditingController();
  final adminIdController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  // Language Management
  Future<void> changeLanguage(String language) async {
    // Save the language using SharedPrefHelper
    await SharedPrefHelper.saveLanguage(language);

    // Update selected language
    selectedLanguage.value = language;

    // Update app locale
    Get.updateLocale(language == "Arabic" ? const Locale('ar') : const Locale('en'));
  }

  // Create Station
  void createStation() {
    final stationName = stationNameController.text.trim();
    final adminId = int.tryParse(adminIdController.text.trim());
    final phone = phoneController.text.trim();
    final location = locationController.text.trim();

    if (stationName.isEmpty || adminId == null || phone.isEmpty || location.isEmpty) {
      Get.snackbar("Error", "Please fill all fields",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Handle station creation logic
    Get.snackbar("Success", "Station Created Successfully",
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onInit() async {
    super.onInit();

    // Retrieve the stored language using SharedPrefHelper
    final storedLanguage = await SharedPrefHelper.getLanguage();
    selectedLanguage.value = storedLanguage;
  }
}