import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/utils/constants.dart';

import '../model/user_model.dart';

class UserController extends GetxController {
  var users = <User>[].obs; // Observable list of users
  var isLoading = true.obs; // Loading state

  // Observable variables for age groups
  var firstAgeGroup = 0.obs;   // 18-25 years
  var secondAgeGroup = 0.obs;  // 25-50 years
  var thirdAgeGroup = 0.obs;   // Above 50 years

  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      final response = await _dio.get(
        'http://${AppConstants.localIp}/api/user',
      );

      if (response.statusCode == 200) {
        final List<dynamic> userList = response.data['message'];
        users.value = userList.map((json) => User.fromJson(json)).toList();

        // Calculate age groups after fetching users
        calculateAgeGroups();
      } else {
        Get.snackbar('Error', 'Failed to fetch users');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  void calculateAgeGroups() {
    // Reset age group counters
    firstAgeGroup.value = 0;
    secondAgeGroup.value = 0;
    thirdAgeGroup.value = 0;

    // Count users in each age group
    for (var user in users) {
      int? age = user.age;

      if (age >= 18 && age <= 25) {
        firstAgeGroup.value++;
      } else if (age > 25 && age <= 50) {
        secondAgeGroup.value++;
      } else if (age > 50) {
        thirdAgeGroup.value++;
      }
        }

    // Optional: Print out the age group distribution
    print('18-25 years: ${firstAgeGroup.value}');
    print('25-50 years: ${secondAgeGroup.value}');
    print('Above 50 years: ${thirdAgeGroup.value}');
  }

  // Existing methods remain the same...
  Future<void> deleteUser(String userId) async {
    try {
      final response = await _dio.delete(
        'http://${AppConstants.localIp}/api/user/$userId',
        options: Options(headers: {'accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        users.removeWhere((user) => user.id == userId);
        Get.snackbar('Success', 'User deleted successfully');
        await fetchUsers();  // This will recalculate age groups
      } else {
        Get.snackbar('Error', 'Failed to delete user');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}