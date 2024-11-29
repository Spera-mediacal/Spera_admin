import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/custom_button.dart';
import '../../../../utils/global_widgets/custom_text_field.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import '../../../controller/doctor_controller.dart';

class AddDoctorSection extends StatelessWidget {
  const AddDoctorSection({
    super.key,
    required this.controller,
  });

  final DoctorController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: controller.selectedImagePath.isNotEmpty
                    ? FileImage(File(controller.selectedImagePath.value))
                    : null,
                child: controller.selectedImagePath.isEmpty
                    ? IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: controller.pickImage,
                )
                    : null,
              ),
            ],
          );
        }),
        (screenHeight(context) * 0.02).sh,
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hintText: 'ID',
                controller: controller.idController,
                keyboardType: TextInputType.number,
              ),
            ),
            (screenWidth(context) * 0.02).sw,
            Expanded(
              child: CustomTextField(
                hintText: 'Name',
                controller: controller.nameController,
              ),
            ),
            (screenWidth(context) * 0.02).sw,
            Expanded(
              child: CustomTextField(
                hintText: 'Phone',
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),
        (screenHeight(context) * 0.02).sh,
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hintText: 'Address',
                controller: controller.addressController,
              ),
            ),
            (screenWidth(context) * 0.02).sw,
            Expanded(
              child: CustomTextField(
                hintText: 'Specialization',
                controller: controller.specializationController,
              ),
            ),
            (screenWidth(context) * 0.02).sw,
            Expanded(
              child: CustomTextField(
                hintText: 'Rate',
                controller: controller.rateController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        (screenHeight(context) * 0.02).sh,
        Row(
          children: [
            TextButton.icon(
              onPressed: () => controller.pickTime(context, true),
              icon: const Icon(Icons.access_time),
              label: Obx(() => Text(controller.startHour.value.isEmpty
                  ? 'Start Hour'
                  : controller.startHour.value)),
            ),
            TextButton.icon(
              onPressed: () => controller.pickTime(context, false),
              icon: const Icon(Icons.access_time),
              label: Obx(() => Text(controller.endHour.value.isEmpty
                  ? 'End Hour'
                  : controller.endHour.value)),
            ),
            TextButton.icon(
              onPressed: () => controller.pickDate(context),
              icon: const Icon(Icons.calendar_today),
              label: Obx(() => Text(controller.joinDate.value.isEmpty
                  ? 'Join Date'
                  : controller.joinDate.value)),
            ),
          ],
        ),
        (screenHeight(context) * 0.02).sh,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              spacing: 8,
              children:
              ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'].map((day) {
                return Obx(() {
                  final isSelected = controller.selectedDays.contains(day);
                  return GestureDetector(
                    onTap: () => controller.toggleDaySelection(day),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: isSelected
                          ? AppColors.accentColor
                          : AppColors.whiteColor.withOpacity(0.3),
                      child: Text(
                        day,
                        style: AppTextStyles.textStyle19.copyWith(
                          color: isSelected
                              ? AppColors.blackColor
                              : AppColors.whiteColor,
                        ),
                      ),
                    ),
                  );
                });
              }).toList(),
            ),
            CustomButton(
              text: 'Add Doctor',
              onTap: controller.addDoctor,
              width: screenWidth(context) * 0.13,
              height: screenHeight(context) * 0.03,
              borderRadius: 10,
            ),
          ],
        ),
      ],
    );
  }
}
