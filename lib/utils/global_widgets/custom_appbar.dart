import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_admin_panel/app/controller/admin_controller.dart';
import 'package:spera_admin_panel/app/controller/blood_staff_controller.dart';
import 'package:spera_admin_panel/app/controller/doctor_controller.dart';
import 'package:spera_admin_panel/app/controller/settings_controller.dart';
import 'package:spera_admin_panel/app/controller/user_controller.dart';

import '../../app/service/shared_pref_helper.dart';
import '../colors.dart';
import '../size_config.dart';
import '../text_styles.dart';
import 'custom_text_field.dart';

class CustomAppBar extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final DoctorController doctorController = Get.put(DoctorController());
  final AdminController adminController = Get.put(AdminController());
  final DonateController bloodStaffController =
      Get.put(DonateController());
  final SettingsController settingsController = Get.put(SettingsController());

  CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight(context) * 0.03),
      child: Row(
        children: [
          SizedBox(
            width: screenWidth(context) * 0.2,
            child: Text(
              title,
              style: AppTextStyles.textStyle40
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(
            flex: 20,
          ),
          CustomTextField(
            hintText: 'Search',
            width: screenWidth(context) * 0.3,
          ),
          const Spacer(flex: 6),
          IconButton(
            onPressed: () async {
              await SharedPrefHelper.saveFullName(
                  adminController.fullNameController.text.trim());
              userController.fetchUsers();
              doctorController.fetchDoctors();
              bloodStaffController.fetchDonations();
              settingsController.fetchStations();
            },
            icon: const Icon(
              Icons.refresh,
              color: AppColors.accentColor,
            ),
          ),
          const Spacer(flex: 6),
          const CircleAvatar(
            backgroundColor: AppColors.greyColor,
            foregroundImage: AssetImage(
              'assets/media/logo.png',
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            settingsController.userFullName.value,
            style: AppTextStyles.textStyle19,
          ),
          const Spacer(
            flex: 1,
          ),

        ],
      ),
    );
  }
}
