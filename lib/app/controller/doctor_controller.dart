import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/doctor_model.dart';

class DoctorController extends GetxController {
  var doctors = <DoctorModel>[].obs;
  var selectedDays = <String>[].obs;
  var selectedImagePath = ''.obs;
  var startHour = ''.obs;
  var endHour = ''.obs;
  var joinDate = ''.obs;

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
      joinDate.value = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
    }
  }

  void addDoctor() {
    final newDoctor = DoctorModel(
      id: int.tryParse(idController.text) ?? 0,
      name: nameController.text,
      phone: phoneController.text,
      address: addressController.text,
      specialization: specializationController.text,
      workDays: selectedDays.toList(),
      rate: double.tryParse(rateController.text) ?? 0.0,
      image: selectedImagePath.value,
      startHour: startHour.value,
      endHour: endHour.value,
      joinDate: joinDate.value,
    );

    doctors.add(newDoctor);

    idController.clear();
    nameController.clear();
    phoneController.clear();
    addressController.clear();
    specializationController.clear();
    rateController.clear();
    selectedDays.clear();
    selectedImagePath.value = '';
    startHour.value = '';
    endHour.value = '';
    joinDate.value = '';
  }

  void toggleDaySelection(String day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }
  }
}
