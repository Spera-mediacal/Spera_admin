import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class BloodRecordContainer extends StatelessWidget {
  const BloodRecordContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.percent,
  });

  final IconData icon;
  final String title;
  final double value;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) * 0.2,
      height: screenHeight(context) * 0.2,
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.accentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
              ),

              Text(
                ' $title',
                style: AppTextStyles.textStyle24
                    .copyWith(color: AppColors.blackColor),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                value.round().toString(),
                style: AppTextStyles.textStyle35.copyWith(
                    color: AppColors.blackColor, fontWeight: FontWeight.bold),
              ),
              Container(
                width: screenWidth(context) * 0.04,
                height: screenHeight(context) * 0.03,
                margin: const EdgeInsets.only(left: 10, bottom: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.blackColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      percent.round().toString(),
                      style: AppTextStyles.textStyle19.copyWith(
                        color: AppColors.accentColor,
                      ),
                    ),
                    Icon(percent>20? HugeIcons.strokeRoundedArrowUpRight01  : HugeIcons.strokeRoundedArrowDownRight01, color: AppColors.accentColor,)
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
