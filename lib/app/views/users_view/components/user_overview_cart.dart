import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class UserOverviewCart extends StatelessWidget {
  const UserOverviewCart({
    super.key,
    required this.data,
    required this.donation,
    required this.address,
    required this.id,
  });

  final String id;
  final String data;
  final int donation;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: screenWidth(context),
      height: screenHeight(context) * 0.08,
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '#$id',
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w400),

          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa-zrKvWcBozPRvgPMHEm2fAgITc48lVqzSg&s'),
              ),

              SizedBox(
                width: screenHeight(context) * 0.01,
              ),
              SizedBox(
                width: 140,
                child: Text(
                  'Steven Nullman',
                  style: AppTextStyles.textStyle19.copyWith(
                      color: AppColors.blackColor, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),

          Text(
            address,
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w400),
          ),
          Text(
            '$donation points',
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          Text(
            '${donation * 100} points',
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          Text(
            data,
            style: AppTextStyles.textStyle15.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
