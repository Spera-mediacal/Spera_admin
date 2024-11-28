import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:spera_admin_panel/utils/text_styles.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';

class UserJoinChart extends StatelessWidget {
  const UserJoinChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(16),
      height: screenHeight(context) * 0.19,
      width: screenWidth(context) * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("User joining",
              style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold
              )),
          (screenHeight(context) * 0.02).sh,
          Expanded(
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,

                      reservedSize: 20,
                      getTitlesWidget: (value, _) {
                        return Text(
                          value.toInt().toString(),
                          style: AppTextStyles.textStyle15
                              .copyWith(color: AppColors.secAccentColor),
                          textAlign: TextAlign.center,
                        );
                      },
                      interval: 5,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        const days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'];
                        return Text(
                          days[value.toInt()],
                          style: AppTextStyles.textStyle15
                              .copyWith(color: AppColors.secAccentColor),
                        );
                      },
                      reservedSize: 20,
                      interval: 1,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border:  const Border(
                    bottom: BorderSide(
                      color: AppColors.secAccentColor,
                      width: 0.5,
                    ),
                    left: BorderSide(
                      color: AppColors.secAccentColor,
                      width: 0.5,
                    ),
                    right: BorderSide.none,
                    top: BorderSide.none,
                  ),
                ),
                gridData: const FlGridData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: AppColors.thirdAccentColor,
                    barWidth: 4,
                    isStrokeCapRound: false,
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.secAccentColor.withOpacity(0.2),
                    ),
                    spots: [
                      const FlSpot(0, 6), // Saturday
                      const FlSpot(1, 4), // Sunday
                      const FlSpot(2, 8), // Monday
                      const FlSpot(3, 10), // Tuesday
                      const FlSpot(4, 2), // Wednesday
                      const FlSpot(5, 8), // Thursday
                    ],
                  ),
                ],
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
