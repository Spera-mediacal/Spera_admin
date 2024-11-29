import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:spera_admin_panel/app/views/dash_board_view/components/progress_item.dart';
import 'package:spera_admin_panel/utils/colors.dart';
import 'package:spera_admin_panel/utils/size_config.dart';
import 'package:spera_admin_panel/utils/text_styles.dart';

import '../../../../utils/global_widgets/custom_appbar.dart';
import '../components/circular_indicators_section.dart';
import '../components/profile_overview_card.dart';
import '../components/summary_card.dart';
import '../components/wave_chart.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: 'Dashboard',
              ),
              const CircularIndicatorsSection(),
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
              ),
              const Row(
                children: [
                  WaveChart(
                    title: 'User Joining',
                    bottomData: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'],
                    spots: [
                      FlSpot(0, 6), // Saturday
                      FlSpot(1, 4), // Sunday
                      FlSpot(2, 8), // Monday
                      FlSpot(3, 10), // Tuesday
                      FlSpot(4, 2), // Wednesday
                      FlSpot(5, 8), // Thursday
                    ],
                  ),WaveChart(
                    title: 'Doctors Joining',
                    bottomData: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June'],
                    spots: [
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
      ),
    );
  }
}
