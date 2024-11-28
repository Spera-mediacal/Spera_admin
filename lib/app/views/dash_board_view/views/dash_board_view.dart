import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_admin_panel/utils/colors.dart';
import 'package:spera_admin_panel/utils/size_config.dart';
import 'package:spera_admin_panel/utils/text_styles.dart';

import '../../../../utils/global_widgets/custom_appbar.dart';
import '../components/profile_overview_card.dart';
import '../components/summary_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

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
                itemBuilder: (context, index) => const ProfileOverviewCard(),
              ), // not scrollable
            ),
            (screenHeight(context) * 0.02).sh,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'Total User',
                  subTitle: '25.1K',
                  incoming: 20,
                ),
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'Total User',
                  subTitle: '25.1K',
                  incoming: 20,
                ),
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'Total User',
                  subTitle: '25.1K',
                  incoming: 20,
                ),
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'Total User',
                  subTitle: '25.1K',
                  incoming: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
