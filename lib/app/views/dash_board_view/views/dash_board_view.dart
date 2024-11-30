import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_admin_panel/utils/colors.dart';
import 'package:spera_admin_panel/utils/size_config.dart';

import '../../../../utils/global_widgets/custom_appbar.dart';
import '../components/circular_indicators_section.dart';
import '../components/summary_card.dart';
import '../components/wave_chart.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'dashboard'.tr,
            ),
            const CircularIndicatorsSection(),
            (screenHeight(context) * 0.02).sh,
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'totalUsers'.tr,
                  subTitle: '25.1K',
                  incoming: 20,
                ),
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'TotalDoctors'.tr,
                  subTitle: '25.1K',
                  incoming: 20,
                ),
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'TotalStations'.tr,
                  subTitle: '25.1K',
                  incoming: 20,
                ),
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'newUsers'.tr,
                  subTitle: '25.1K',
                  incoming: 20,
                ),
              ],
            ),
             Row(
              children: [
                WaveChart(
                  title: 'usersJoining'.tr,
                  bottomData: const ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'],
                  spots: const [
                    FlSpot(0, 6), // Saturday
                    FlSpot(1, 4), // Sunday
                    FlSpot(2, 8), // Monday
                    FlSpot(3, 10), // Tuesday
                    FlSpot(4, 2), // Wednesday
                    FlSpot(5, 8), // Thursday
                  ],
                ),WaveChart(
                  title: 'doctorsJoining'.tr,
                  bottomData: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June'],
                  spots: const [
                    FlSpot(0, 2), // Saturday
                    FlSpot(1, 4), // Sunday
                    FlSpot(2, 6), // Monday
                    FlSpot(3, 8), // Tuesday
                    FlSpot(4, 2), // Wednesday
                    FlSpot(5, 10), // Thursday
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
