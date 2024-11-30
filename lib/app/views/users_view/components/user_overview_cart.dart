import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_admin_panel/app/model/user_model.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class UserOverviewCart extends StatelessWidget {
  const UserOverviewCart({
    super.key,

    required this.user,
  });

  final User user;


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
        children: [
          const Spacer(
            flex: 4,
          ),
          Text(
            '#${user.id}',
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w400),
          ),
          const Spacer(
            flex: 8,
          ),
          SizedBox(
            width: 140,
            child: Text(
              user.name,
              style: AppTextStyles.textStyle19.copyWith(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const Spacer(
            flex: 7,
          ),
          Text(
            user.phone,
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w400),
          ),
          const Spacer(
            flex: 10,
          ),
          Text(
            user.bloodType,
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 10,
          ),
          Text(
            "${user.age} ${'points'.tr}",
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 9,
          ),
          Text(
            '${user.height}',
            style: AppTextStyles.textStyle15.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
