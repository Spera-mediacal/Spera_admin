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
            '#$id',
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w400),
          ),
          const Spacer(
            flex: 4,
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
                  'Steven Nullmanfwwqffwqw',
                  style: AppTextStyles.textStyle19.copyWith(
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 5,
          ),
          Text(
            address,
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w400),
          ),
          const Spacer(
            flex: 10,
          ),
          Text(
            '$donation points',
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 10,
          ),
          Text(
            '${donation * 100} points',
            style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 9,
          ),
          Text(
            data,
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
