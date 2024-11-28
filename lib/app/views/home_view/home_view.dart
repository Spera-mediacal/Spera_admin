import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_admin_panel/utils/colors.dart';
import 'package:spera_admin_panel/utils/size_config.dart';
import 'package:spera_admin_panel/utils/text_styles.dart';

import '../../../utils/global_widgets/custom_appbar.dart';
import '../../../utils/global_widgets/profile_overview_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: 'Overview',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Doctors',
                  style: AppTextStyles.textStyle19,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: AppTextStyles.textStyle19
                        .copyWith(color: AppColors.accentColor),
                  ),
                ),
              ],
            ),
            (screenHeight(context) * 0.01).sh,
            SizedBox(
              height: screenHeight(context) * 0.4,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => ProfileOverviewCard(),
              ), // not scrollable
            ),
            (screenHeight(context) * 0.02).sh,
            SummaryCard()
          ],
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: screenWidth(context) * 0.2,
      height: screenWidth(context) * 0.11,
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total User',
                    style: AppTextStyles.textStyle24
                        .copyWith(color: AppColors.blackColor),
                  ),
                  Text(
                    '25.1k',
                    style: AppTextStyles.textStyle35.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(
                flex: 9,
              ),
              const Icon(
                HugeIcons.strokeRoundedHumidity,
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
              Icon(HugeIcons.strokeRoundedArrowDown01),
              Text(
                '+18',
                style: AppTextStyles.textStyle19
                    .copyWith(color: AppColors.blackColor),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View Report',
                  style: AppTextStyles.textStyle19.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
