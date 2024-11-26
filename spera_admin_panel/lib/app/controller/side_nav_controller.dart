import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideNavController extends GetxController {
  final List<String> pageTitles = [
    "Dashboard",
    "Users",
    "Blood",
    "Settings",
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
