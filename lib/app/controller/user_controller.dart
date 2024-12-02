import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/utils/constants.dart';

import '../model/user_model.dart';

class UserController extends GetxController {
  var users = <User>[].obs; // Observable list of users
  var isLoading = true.obs; // Loading state

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

        // Reset age groups
        thirdAgeGroup.value = 0;
        secondAgeGroup.value = 0;
        firstAgeGroup.value = 0;

        int firstGroupCount = 0;
        int secondGroupCount = 0;
        int thirdGroupCount = 0;
        int totalUsers = users.length;

        for (var user in users) {
          if (user.age >= 18 && user.age <= 25) {
            firstGroupCount++;
          } else if (user.age > 25 && user.age <= 50) {
            secondGroupCount++;
          } else if (user.age > 50) {
            thirdGroupCount++;
          }
        }

        // Calculate percentages
        firstAgeGroup.value = ((firstGroupCount / totalUsers) * 100).round();
        secondAgeGroup.value = ((secondGroupCount / totalUsers) * 100).round();
        thirdAgeGroup.value = ((thirdGroupCount / totalUsers) * 100).round();

      } else {
        Get.snackbar('Error', 'Failed to fetch users');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }


  Future<void> deleteUser(String userId) async {
    try {
      final response = await _dio.delete(
        'http://${AppConstants.localIp}/api/user/$userId',
        options: Options(headers: {'accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        users.removeWhere((user) => user.id == userId);
        Get.snackbar('Success', 'User deleted successfully');
        await fetchUsers();
      } else {
        Get.snackbar('Error', 'Failed to delete user');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}