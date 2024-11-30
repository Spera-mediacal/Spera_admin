import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/custom_appbar.dart';
import '../../../../utils/global_widgets/custom_button.dart';
import '../../../../utils/global_widgets/custom_text_field.dart';
import '../../../../utils/size_config.dart';
import '../../../controller/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Container(
      width: screenWidth(context),
      height: screenHeight(context),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'settings'.tr,
            ),
            const SizedBox(height: 20),
            // Language Picker
            Obx(
                  () => DropdownButton<String>(
                value: controller.selectedLanguage.value,
                dropdownColor: AppColors.blackColor,
                items: controller.languages
                    .map(
                      (lang) => DropdownMenuItem<String>(
                    value: lang,
                    child: Text(
                      lang.tr,
                      style: const TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.changeLanguage(value);
                  }
                },
              ),
            ),
            const SizedBox(height: 20),

            // App Information Section
             Text(
              "applicationInfo".tr,
              style: const TextStyle(color: AppColors.whiteColor, fontSize: 18),
            ),
            const SizedBox(height: 10),
            ListTile(
              title:  Text(
                "facebook".tr,
                style: const TextStyle(color: AppColors.whiteColor),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.facebook, color: AppColors.accentColor),
                onPressed: () {
                  // Handle Facebook redirection
                },
              ),
            ),
            ListTile(
              title:  Text(
                "website".tr,
                style: const TextStyle(color: AppColors.whiteColor),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.web, color: AppColors.accentColor),
                onPressed: () {
                  // Handle Website redirection
                },
              ),
            ),
            ListTile(
              title: Text(
                "${'version'.tr} 1.0.0",
                style: const TextStyle(color: AppColors.whiteColor),
              ),
            ),
            const SizedBox(height: 20),

            // Create Station Section
             Text(
              "createStation".tr,
              style: const TextStyle(color: AppColors.whiteColor, fontSize: 18),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: "stationName".tr,
              controller: controller.stationNameController,
            ),
            CustomTextField(
              hintText: "adminId".tr,
              keyboardType: TextInputType.number,
              controller: controller.adminIdController,
            ),
            CustomTextField(
              hintText: "phone".tr,
              keyboardType: TextInputType.phone,
              controller: controller.phoneController,
            ),
            CustomTextField(
              hintText: "location".tr,
              controller: controller.locationController,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "createStation".tr,
              onTap: controller.createStation,
              width: screenWidth(context),
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
