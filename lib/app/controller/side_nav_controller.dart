import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/app/views/doctors_view/views/doctors_view.dart';
import 'package:spera_admin_panel/app/views/users_view/views/users_view.dart';

import '../views/dash_board_view/views/dash_board_view.dart';

class SideNavController extends GetxController {
  final List<String> pageTitles = [
    "Dashboard",
    "Users",
    "Doctors",
    "Blood",
    "Settings",
  ];

  final List<Widget> pageViews = [
    const DashboardView(),
    const UsersView(),
     DoctorsView()
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
