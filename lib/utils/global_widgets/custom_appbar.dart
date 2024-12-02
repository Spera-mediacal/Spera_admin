import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_admin_panel/app/controller/settings_controller.dart';

import '../colors.dart';
import '../size_config.dart';
import '../text_styles.dart';
import 'custom_text_field.dart';

class CustomAppBar extends StatelessWidget {
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
          const Icon(
            Icons.notifications,
            color: AppColors.accentColor,
          ),
          const Spacer(flex: 6),
          const CircleAvatar(
            backgroundColor: AppColors.greyColor,
            backgroundImage: AssetImage('assets/media/logo.png'),
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
          IconButton(
            onPressed: () {},
            icon: const Icon(
              HugeIcons.strokeRoundedArrowDown01,
              color: AppColors.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
