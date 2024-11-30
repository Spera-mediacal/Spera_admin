import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../service/shared_pref_helper.dart'; // Adjust import as needed

class SettingsController extends GetxController {
  final selectedLanguage = "English".obs;
  final languages = ["English", "Arabic"];

  // Dio instance for network requests
  final Dio _dio = Dio();

  // Text Editing Controllers
  final stationNameController = TextEditingController();
  final adminIdController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  // Loading state for creating station
  final isLoading = false.obs;

  // Language Management
  Future<void> changeLanguage(String language) async {
    // Save the language using SharedPrefHelper
    await SharedPrefHelper.saveLanguage(language);
    // Update selected language
    selectedLanguage.value = language;
    // Update app locale
    Get.updateLocale(language == "Arabic" ? const Locale('ar') : const Locale('en'));
  }

  // Create Station with Dio
  Future<void> createStation() async {
    final stationName = stationNameController.text.trim();
    final adminId = int.tryParse(adminIdController.text.trim());
    final phone = phoneController.text.trim();
    final location = locationController.text.trim();

    // Input validation
    if (stationName.isEmpty || adminId == null || phone.isEmpty || location.isEmpty) {
      Get.snackbar("Error", "Please fill all fields",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      // Set loading state
      isLoading.value = true;

      // Prepare station data
      final stationData = {
        "name": stationName,
        "admin_id": adminId,
        "phone": phone,
        "location": location
      };

      // Send POST request
      final response = await _dio.post(
        'http://127.0.0.1:8000/api/station',
        data: stationData,
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      // Check response
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Clear text controllers
        stationNameController.clear();
        adminIdController.clear();
        phoneController.clear();
        locationController.clear();

        // Show success message
        Get.snackbar(
          "Success",
          "Station Created Successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        // Handle unexpected response
        Get.snackbar(
          "Error",
          "Failed to create station",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on DioException catch (e) {
      // Handle network or server errors
      String errorMessage = "An error occurred";

      if (e.response != null) {
        // Server responded with an error
        errorMessage = e.response?.data['message'] ??
            "Failed to create station. Please try again.";
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = "Connection timeout. Please check your internet.";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = "Receive timeout. Please try again.";
      }

      Get.snackbar(
        "Error",
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      // Reset loading state
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    // Retrieve the stored language using SharedPrefHelper
    final storedLanguage = await SharedPrefHelper.getLanguage();
    selectedLanguage.value = storedLanguage;
  }

  @override
  void onClose() {
    // Dispose controllers to prevent memory leaks
    stationNameController.dispose();
    adminIdController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.onClose();
  }
}