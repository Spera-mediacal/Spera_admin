import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/app/views/dash_board_view/components/progress_item.dart';

class CircularIndicatorsSection extends StatelessWidget {
  const CircularIndicatorsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ProgressItem(
          footer: 'usersBetween18And25'.tr,
          percentage: 15,
        ), ProgressItem(
          footer: 'usersBetween25And50'.tr,
          percentage: 80,
        ), ProgressItem(
          footer: 'usersAbove50'.tr,
          percentage: 5,
        ),
      ],
    );
  }
}
