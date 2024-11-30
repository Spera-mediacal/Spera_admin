import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/app/controller/user_controller.dart';
import 'package:spera_admin_panel/app/views/dash_board_view/components/progress_item.dart';

class CircularIndicatorsSection extends StatelessWidget {
   CircularIndicatorsSection({
    super.key,
  });

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ProgressItem(
          footer: 'usersBetween18And25'.tr,
          percentage: userController.firstAgeGroup.value.toDouble(),
        ), ProgressItem(
          footer: 'usersBetween25And50'.tr,
          percentage: userController.secondAgeGroup.value.toDouble(),
        ), ProgressItem(
          footer: 'usersAbove50'.tr,
          percentage: userController.thirdAgeGroup.value.toDouble(),
        ),
      ],
    );
  }
}
