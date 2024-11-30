import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/app/views/doctors_view/views/doctors_view.dart';
import 'package:spera_admin_panel/app/views/settings_view/views/settings_view.dart';
import 'package:spera_admin_panel/app/views/users_view/views/users_view.dart';

import '../views/blood_staff_view/views/blood_staff_view.dart';
import '../views/dash_board_view/views/dash_board_view.dart';

class SideNavController extends GetxController {
  // Dynamic getter for page titles
  List<String> get pageTitles => [
    'dashboard'.tr,
    'users'.tr,
    'doctors'.tr,
    'blood'.tr,
    'settings'.tr,
  ];

  final List<Widget> pageViews = [
     DashboardView(),
     UsersView(),
    DoctorsView(),
    BloodStaffView(),
    const SettingsView()
  ];

  final List<IconData> pageIcons = [
    Icons.dashboard,
    Icons.person,
    Icons.people_alt,
    Icons.bloodtype,
    Icons.settings,
  ];

  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
