import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.incoming,
    required this.icon,
  });

  final String title;
  final String subTitle;
  final int incoming;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: screenWidth(context) * 0.19,
      height: screenHeight(context) * 0.18,
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.textStyle24
                        .copyWith(color: AppColors.blackColor),
                  ),
                  Text(
                    subTitle,
                    style: AppTextStyles.textStyle35.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(
                flex: 9,
              ),
              Icon(
                icon,
                color: AppColors.blackColor,
                size: 32,
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ),
          Row(
            children: [
              const Icon(HugeIcons.strokeRoundedArrowDown01),
              Text(
                '$incoming%',
                style: AppTextStyles.textStyle19
                    .copyWith(color: AppColors.blackColor),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View Report',
                  style: AppTextStyles.textStyle19.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.blackColor),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
