import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../model/donation.dart';

class DonateController extends GetxController {
  TextEditingController stationAddress = TextEditingController();
  TextEditingController examinerName = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController bloodType = TextEditingController();

  Rx<String> qrData = ''.obs;
  var isLoading = false.obs;
  var donateList = <Donate>[].obs;

  // Blood type counts
  var bloodTypeCounts = <String, int>{
    'A+': 0,
    'A-': 0,
    'B+': 0,
    'B-': 0,
    'O+': 0,
    'O-': 0,
    'AB+': 0,
    'AB-': 0,
  }.obs;

  // Donation summaries
  var dailyDonations = 0.obs;
  var weeklyDonations = 0.obs;
  var monthlyDonations = 0.obs;
  var yearlyDonations = 0.obs;

  final Dio _dio = Dio(BaseOptions(baseUrl: "http://127.0.0.1:8000/api"));

  void generateQRCode() {
    qrData.value = '''
    {
      "station":"${stationAddress.text}",
      "examiner":"${examinerName.text}",
      "quantity":"${quantity.text}",
      "bloodType":"${bloodType.text}"
    }
    ''';
    stationAddress.clear();
    examinerName.clear();
    quantity.clear();
    bloodType.clear();
  }

  Future<void> fetchDonations() async {
    isLoading(true);
    try {
      final response = await _dio.get('/donate',
          options: Options(headers: {'accept': 'application/json'}));
      if (response.statusCode == 200) {
        var data = response.data as List;
        donateList.value = data.map((item) => Donate.fromJson(item)).toList();
        _calculateStatistics();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch donations: $e");
    } finally {
      isLoading(false);
    }
  }

  void _calculateStatistics() {
    _resetStatistics();
    final now = DateTime.now();

    for (var donate in donateList) {
      // Count blood types
      bloodTypeCounts[donate.bloodType] =
          (bloodTypeCounts[donate.bloodType] ?? 0) + donate.donateQuantity;

      // Parse donation date
      final donateDate = DateFormat('d-M-yyyy').parse(donate.donateDate);

      // Calculate daily donations
      if (isSameDay(donateDate, now)) {
        dailyDonations.value += donate.donateQuantity;
      }

      // Calculate weekly donations (assumes Sunday is the start of the week)
      if (isSameWeek(donateDate, now)) {
        weeklyDonations.value += donate.donateQuantity;
      }

      // Calculate monthly donations
      if (donateDate.year == now.year && donateDate.month == now.month) {
        monthlyDonations.value += donate.donateQuantity!;
      }

      // Calculate yearly donations
      if (donateDate.year == now.year) {
        yearlyDonations.value += donate.donateQuantity;
      }
    }
  }

  void _resetStatistics() {
    bloodTypeCounts.updateAll((key, value) => 0);
    dailyDonations.value = 0;
    weeklyDonations.value = 0;
    monthlyDonations.value = 0;
    yearlyDonations.value = 0;
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool isSameWeek(DateTime date1, DateTime date2) {
    final firstDayOfWeek = date2.subtract(Duration(days: date2.weekday - 1));
    final lastDayOfWeek = firstDayOfWeek.add(Duration(days: 6));
    return date1.isAfter(firstDayOfWeek.subtract(const Duration(days: 1))) &&
        date1.isBefore(lastDayOfWeek.add(const Duration(days: 1)));
  }
}




/*


  // Future<void> fetchDonations() async {
  //   const String url = 'http://${AppConstants.localIp}/api/donate';
  //   try {
  //     final response = await dio.get(url);
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = response.data;
  //       donations.value = data.map((e) => Donation.fromJson(e)).toList();
  //
  //       calculateDonationCounts();
  //
  //       // Calculate blood type counts
  //       calculateBloodTypeCounts();
  //     } else {
  //       throw Exception('Failed to load donations');
  //     }
  //   } catch (e) {
  //     print(e);
  //     Get.snackbar('Error', 'Failed to fetch data: $e');
  //   }
  // }

  // void calculateDonationCounts() {
  //   // Get current date
  //   DateTime now = DateTime.now();
  //
  //   // Yearly donations (current year)
  //   yearlyDonations.value = donations.where((donation) {
  //     DateTime donationDate = _parseDate(donation.donateDate);
  //     return donationDate.year == now.year;
  //   }).length;
  //
  //   // Monthly donations (current month)
  //   monthlyDonations.value = donations.where((donation) {
  //     DateTime donationDate = _parseDate(donation.donateDate);
  //     return donationDate.year == now.year && donationDate.month == now.month;
  //   }).length;
  //
  //   // Weekly donations (current week)
  //   weeklyDonations.value = donations.where((donation) {
  //     DateTime donationDate = _parseDate(donation.donateDate);
  //     return _isSameWeek(donationDate, now);
  //   }).length;
  //
  //   // Daily donations (today)
  //   dailyDonations.value = donations.where((donation) {
  //     DateTime donationDate = _parseDate(donation.donateDate);
  //     return _isSameDay(donationDate, now);
  //   }).length;
  // }
  //
  // void calculateBloodTypeCounts() {
  //   Map<String, int> typeCounts = {};
  //   for (var donation in donations) {
  //     typeCounts[donation.bloodType] = (typeCounts[donation.bloodType] ?? 0) + 1;
  //   }
  //   bloodTypeCounts.value = typeCounts;
  // }
  //

  // Helper method to parse date string
  DateTime _parseDate(String dateString) {
    List<String> parts = dateString.split('-');
    return DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(parts[0]),
    );
  }

  // Check if two dates are in the same week
  bool _isSameWeek(DateTime date1, DateTime date2) {
    final weekStart1 = date1.subtract(Duration(days: date1.weekday - 1));
    final weekStart2 = date2.subtract(Duration(days: date2.weekday - 1));
    return weekStart1 == weekStart2;
  }

  // Check if two dates are the same day
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

 */