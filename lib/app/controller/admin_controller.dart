import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:spera_admin_panel/app/routes/app_routes.dart';

import '../service/shared_pref_helper.dart';

class AdminController extends GetxController {
  // Text Editing Controllers
  final loginUsernameController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // State
  var isLogin = true.obs;
  var isLoading = false.obs;

  // Base URL
  final String baseUrl = "http://127.0.0.1:8000/api/admin";


  @override
  void onInit() {
    super.onInit();
   }

  // Register Method
  Future<void> register() async {
    isLoading.value = true;
    final String name = fullNameController.text.trim();
    final String username =
        usernameController.text.trim(); // Assuming email acts as the username
    final String password = registerPasswordController.text.trim();

    // Confirm passwords match
    if (password != confirmPasswordController.text.trim()) {
      Get.snackbar("Error", "Passwords do not match");
      isLoading.value = false;

      return;
    }

    // Prepare Request
    final url = Uri.parse(baseUrl);
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({
      "name": name,
      "username": username,
      "password": password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        isLoading.value = false;
        final data = jsonDecode(response.body);
        await SharedPrefHelper.saveFullName(fullNameController.text.trim());
        Get.snackbar(
          "Success",
          "Go and login now!", // Added proper string
          backgroundColor: Colors.green, // Added background color
          colorText: Colors.white, // Explicit text color
          snackPosition: SnackPosition.BOTTOM, // Optional: specify position
        );
      } else {
        isLoading.value = false;
        final error = jsonDecode(response.body);
        Get.snackbar(
          "Error",
          error['message'] ?? "Registration failed", // Provide a default message
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;

      Get.snackbar("Error", "Something went wrong. Please try again.");
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    final url = Uri.parse("$baseUrl/login");
    final headers = {"Content-Type": "application/x-www-form-urlencoded"};
    final body = {
      "grant_type": "password",
      "username": loginUsernameController.text,
      "password": loginPasswordController.text,
      "scope": "",
      "client_id": "string",
      "client_secret": "string",
    };

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        isLoading.value = false;
        final data = jsonDecode(response.body);
        await SharedPrefHelper.saveAccessToken(data['access_token']);
        Get.snackbar("Success", "Login successful");
        print("Access Token: ${data['access_token']}");
        Get.offAllNamed(AppRoutes.sideNavViewPath);
        Get.offNamed('/sideNavViewPath'); // Replace with actual route
      } else {
        final error = jsonDecode(response.body);
        Get.snackbar("Error", error['message'] ?? "Login failed");
        isLoading.value = false;

      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong. Please try again.");
      isLoading.value = false;

    }
  }


}
