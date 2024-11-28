import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/custom_appbar.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context),
      decoration: const BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'Doctors',
            ),
            Text(
              'All Doctors',
              style: AppTextStyles.textStyle24,
            ),
          ],
        ),
      ),
    );
  }
}
