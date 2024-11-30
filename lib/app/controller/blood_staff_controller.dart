import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spera_admin_panel/utils/constants.dart';

import '../model/donation.dart';

class BloodStaffController extends GetxController {
  TextEditingController stationAddress = TextEditingController();
  TextEditingController examinerName = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController bloodType = TextEditingController();

  Rx<String> qrData = ''.obs;

  final RxList<Donation> donations = <Donation>[].obs;
  final Dio dio = Dio();

  // Observable donation count values
  RxInt yearlyDonations = 0.obs;
  RxInt monthlyDonations = 0.obs;
  RxInt weeklyDonations = 0.obs;
  RxInt dailyDonations = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDonations();
  }

  // Previous methods remain the same...

  Future<void> fetchDonations() async {
    const String url = 'http://${AppConstants.localIp}/api/donate';
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        donations.value = data.map((e) => Donation.fromJson(e)).toList();

        // Calculate donation counts after fetching
        calculateDonationCounts();
      } else {
        throw Exception('Failed to load donations');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data: $e');
    }
  }

  void calculateDonationCounts() {
    // Get current date
    DateTime now = DateTime.now();

    // Yearly donations (current year)
    yearlyDonations.value = donations.where((donation) {
      DateTime donationDate = _parseDate(donation.date);
      return donationDate.year == now.year;
    }).length;

    // Monthly donations (current month)
    monthlyDonations.value = donations.where((donation) {
      DateTime donationDate = _parseDate(donation.date);
      return donationDate.year == now.year && donationDate.month == now.month;
    }).length;

    // Weekly donations (current week)
    weeklyDonations.value = donations.where((donation) {
      DateTime donationDate = _parseDate(donation.date);
      return _isSameWeek(donationDate, now);
    }).length;

    // Daily donations (today)
    dailyDonations.value = donations.where((donation) {
      DateTime donationDate = _parseDate(donation.date);
      return _isSameDay(donationDate, now);
    }).length;
  }

  // Helper method to parse date string (same as before)
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

}

