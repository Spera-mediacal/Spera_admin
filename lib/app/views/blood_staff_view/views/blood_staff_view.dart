import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_admin_panel/utils/global_widgets/custom_appbar.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../components/blood_record_container.dart';

class BloodStaffView extends StatelessWidget {
  const BloodStaffView({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [
          const CustomAppBar(title: 'Blood staff'),
          Row(
            children: [
              Expanded(
                child: BloodRecordContainer(
                  icon: HugeIcons.strokeRoundedEye,
                  percent: 20,
                  title: 'Yearly donations',
                  value: 20,
                ),
              ), Expanded(
                child: BloodRecordContainer(
                  icon: HugeIcons.strokeRoundedEye,
                  percent: 20,
                  title: 'Yearly donations',
                  value: 20,
                ),
              ), Expanded(
                child: BloodRecordContainer(
                  icon: HugeIcons.strokeRoundedEye,
                  percent: 20,
                  title: 'Yearly donations',
                  value: 20,
                ),
              ), Expanded(
                child: BloodRecordContainer(
                  icon: HugeIcons.strokeRoundedEye,
                  percent: 20,
                  title: 'Yearly donations',
                  value: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
