import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class ProfileOverviewCard extends StatelessWidget {
  const ProfileOverviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: screenWidth(context),
      height: screenHeight(context) * 0.08,
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Dr Steven Null-man',
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w400),
          ),
          Text(
            'Dr Steven Null man',
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w400),
          ),
          Text(
            'From 1AM',
            style: AppTextStyles.textStyle15.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          Text(
            'To 1 AM',
            style: AppTextStyles.textStyle15.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const Row(
            children: [
              Icon(Icons.star_rate_sharp),
              Icon(Icons.star_rate_sharp),
              Icon(Icons.star_rate_sharp),
              Icon(Icons.star_rate_sharp),
              Icon(Icons.star_outline_sharp),
            ],
          )
        ],
      ),
    );
  }
}
