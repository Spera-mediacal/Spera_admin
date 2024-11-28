import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/app/views/home_view/home_view.dart';

class SideNavController extends GetxController {
  final List<String> pageTitles = [
    "Dashboard",
    "Users",
    "Blood",
    "Settings",
  ];

  final List<Widget> pageViews = [
    HomeView(),

  ];

  final List<IconData> pageIcons = [
    Icons.dashboard,
    Icons.people,
    Icons.bloodtype,
    Icons.settings,
  ];

  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
