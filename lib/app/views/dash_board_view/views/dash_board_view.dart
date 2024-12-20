import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_admin_panel/app/controller/doctor_controller.dart';
import 'package:spera_admin_panel/app/controller/settings_controller.dart';
import 'package:spera_admin_panel/app/controller/user_controller.dart';
import 'package:spera_admin_panel/utils/colors.dart';
import 'package:spera_admin_panel/utils/size_config.dart';

import '../../../../utils/global_widgets/custom_appbar.dart';
import '../components/circular_indicators_section.dart';
import '../components/summary_card.dart';
import '../components/wave_chart.dart';

class DashboardView extends StatelessWidget {
   DashboardView({super.key});
  final UserController userController = Get.put(UserController());
  final DoctorController doctorController = Get.put(DoctorController());
  final SettingsController settingsController = Get.put(SettingsController());
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
             CircularIndicatorsSection(),
            (screenHeight(context) * 0.02).sh,
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'totalUsers'.tr,
                  subTitle: '${userController.users.length}',
                  incoming: 7,
                ),
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'TotalDoctors'.tr,
                  subTitle: '${doctorController.doctorsList.length}',
                  incoming: 5,
                ),
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'TotalStations'.tr,
                  subTitle: '${settingsController.stationsList.length}',
                  incoming: 3,
                ),
                SummaryCard(
                  icon: HugeIcons.strokeRoundedArrowExpand,
                  title: 'newUsers'.tr,
                  subTitle: '${userController.users.length-(userController.users.length-3)}',
                  incoming: 4,
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
                    FlSpot(1, 0), // Sunday
                    FlSpot(2, 8), // Monday
                    FlSpot(3, 10), // Tuesday
                    FlSpot(4, 2), // Wednesday
                    FlSpot(5, 8), // Thursday
                  ],
                ),WaveChart(
                  title: 'doctorsJoining'.tr,
                  bottomData: const ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                  spots: () {
                    final monthlyJoins = doctorController.getMonthlyJoins();
                    List<FlSpot> spots = [];

                    // The months you want to display
                    final displayMonths = ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

                    for (int i = 0; i < displayMonths.length; i++) {
                      final monthValue = monthlyJoins[displayMonths[i]] ?? 0;
                      spots.add(FlSpot(i.toDouble(), monthValue.toDouble()));
                    }

                    return spots;
                  }(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
