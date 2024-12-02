import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../model/stations_model.dart';
import '../service/shared_pref_helper.dart';

class SettingsController extends GetxController {
  final selectedLanguage = "English".obs;
  final languages = ["English", "Arabic"];

  final Dio _dio = Dio();

  var userFullName = ''.obs;
  var userAccessToken = ''.obs;

  Future<void> _loadFullName() async {
    final fullName = await SharedPrefHelper.getFullName();

    userFullName.value = fullName ?? 'No name yet';
  }
  Future<void> _loadAccessToken() async {
    final accessToken = await SharedPrefHelper.getAccessToken();

    userAccessToken.value = accessToken ?? 'No access token yet';
  }


  final stationNameController = TextEditingController();
  final adminIdController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  final isLoading = false.obs;
  RxList<Station> stationsList = <Station>[].obs;
  RxBool isStationsLoading = false.obs;

  Future<void> changeLanguage(String language) async {
    await SharedPrefHelper.saveLanguage(language);

    selectedLanguage.value = language;

    Get.updateLocale(
        language == "Arabic" ? const Locale('ar') : const Locale('en'));
  }

  Future<void> createStation() async {
    final stationName = stationNameController.text.trim();
    final adminId = int.tryParse(adminIdController.text.trim());
    final phone = phoneController.text.trim();
    final location = locationController.text.trim();

    if (stationName.isEmpty ||
        adminId == null ||
        phone.isEmpty ||
        location.isEmpty) {
      Get.snackbar("Error", "Please fill all fields",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value = true;

      final stationData = {
        "name": stationName,
        "admin_id": adminId,
        "phone": phone,
        "location": location
      };

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

      if (response.statusCode == 200 || response.statusCode == 201) {
        stationNameController.clear();
        adminIdController.clear();
        phoneController.clear();
        locationController.clear();

        Get.snackbar(
          "Success",
          "Station Created Successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Error",
          "Failed to create station",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on DioException catch (e) {
      String errorMessage = "An error occurred";

      if (e.response != null) {
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
      isLoading.value = false;
    }
  }

  Future<void> fetchStations() async {
    try {
      isStationsLoading.value = true;

      final response = await _dio.get(
        'http://127.0.0.1:8000/api/station',
        options: Options(
          headers: {
            'accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> stationsData = response.data['message'];

        stationsList.value = stationsData
            .map((stationJson) => Station.fromJson(stationJson))
            .toList();
        print('stationsList.length');
        print("======${stationsList.length}");
      } else {
        Get.snackbar(
          "Error",
          "Failed to fetch stations",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on DioException catch (e) {
      String errorMessage = "An error occurred while fetching stations";

      if (e.response != null) {
        errorMessage = e.response?.data['message'] ??
            "Failed to fetch stations. Please try again.";
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
      isStationsLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    final storedLanguage = await SharedPrefHelper.getLanguage();
    selectedLanguage.value = storedLanguage;
    fetchStations();
    _loadFullName();
    _loadAccessToken();
  }

  @override
  void onClose() {
    stationNameController.dispose();
    adminIdController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.onClose();
  }
}
