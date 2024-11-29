import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BloodStaffController extends GetxController {
  TextEditingController stationAddress = TextEditingController();
  TextEditingController examinerName = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController bloodType = TextEditingController();

  Rx<String> qrData = ''.obs;

  void generateQRCode() {
    qrData.value = '''
    {
      "station":"${stationAddress.text}",
      "examiner":"${examinerName.text}",
      "quantity":"${quantity.text}",
      "bloodType":"${bloodType.text}"
    }
    ''';
    log(qrData.value);
    stationAddress.clear();
    examinerName.clear();
    quantity.clear();
    bloodType.clear();
  }
}
