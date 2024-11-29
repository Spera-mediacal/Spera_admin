import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_styles.dart';

class ProgressItem extends StatelessWidget {
  const ProgressItem({
    super.key,
    required this.footer,
    required this.percentage,
  });

  final String footer;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 120.0,
      lineWidth: 13.0,
      animation: true,
      percent: percentage / 100,
      center: Text(
        "$percentage%",
        style: AppTextStyles.textStyle35.copyWith(color: AppColors.accentColor),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Text(footer,
            style: AppTextStyles.textStyle27
                .copyWith(color: AppColors.accentColor)),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: AppColors.accentColor,
      backgroundColor: AppColors.bgColor,
    );
  }
}
