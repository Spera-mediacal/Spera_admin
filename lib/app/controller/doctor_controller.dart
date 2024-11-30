import 'dart:convert';
import 'dart:io' as io;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spera_admin_panel/utils/constants.dart';

import '../model/doctor_model.dart';
import 'package:http/http.dart' as http;

class DoctorController extends GetxController {
  var selectedDays = <String>[].obs;
  var selectedImagePath = ''.obs;
  var startHour = ''.obs;
  var endHour = ''.obs;
  var joinDate = ''.obs;

  final Dio dio = Dio();
  RxList<DoctorModel> doctorsList = <DoctorModel>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  final idController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final specializationController = TextEditingController();
  final rateController = TextEditingController();

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      print('baaaaaaaaaaaaaaaase 64');
      print(base64Encode(io.File(pickedFile.path).readAsBytesSync()));
    }
  }

  Future<void> pickTime(BuildContext context, bool isStartTime) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      final formattedTime = pickedTime.format(context);
      if (isStartTime) {
        startHour.value = formattedTime;
      } else {
        endHour.value = formattedTime;
      }
    }
  }

  Future<void> pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      joinDate.value =
          "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
    }
  }

  Future<void> submitDoctorData() async {
    try {
      final url = Uri.parse('http://${AppConstants.localIp}/api/doctor');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "id": idController.text,
          "name": nameController.text,
          "specialization": specializationController.text,
          "workDays": selectedDays,
          "phone": phoneController.text,
          "start": startHour.value,
          "end": endHour.value,
          "rate": double.tryParse(rateController.text) ?? 0.0,
          "address": addressController.text,
          "joinDate": joinDate.value,
          "image": selectedImagePath.value,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        Get.snackbar('Success', 'Doctor added successfully');
      } else {
        Get.snackbar('Error', 'Failed to add doctor');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> fetchDoctors() async {
    isLoading.value = true;

    try {
      final response = await dio.get(
        "http://${AppConstants.localIp}/api/doctor",
        options: Options(
          headers: {"accept": "application/json"},
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['message'];
        doctorsList.value =
            data.map((json) => DoctorModel.fromJson(json)).toList();
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching doctors: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteDoctor(String doctorId) async {
    try {
      final response = await dio.delete(
        "http://${AppConstants.localIp}/api/doctor/$doctorId",
        options: Options(
          headers: {"accept": "application/json"},
        ),
      );

      if (response.statusCode == 200) {
        doctorsList.removeWhere((doctor) => doctor.id == doctorId);

        Get.snackbar('Success', 'Doctor deleted successfully');

        await fetchDoctors();
      } else {
        Get.snackbar('Error', 'Failed to delete doctor');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void toggleDaySelection(String day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }
  }
}
