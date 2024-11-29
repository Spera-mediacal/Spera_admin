import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:spera_admin_panel/utils/text_styles.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';

class WaveChart extends StatelessWidget {
  const WaveChart({
    super.key,
    required this.title,
    required this.bottomData,
    required this.spots,
  });

  final String title;
  final List<String> bottomData;
  final List<FlSpot> spots;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(16),
        height: screenHeight(context) * 0.25,
        width: screenWidth(context) * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.greyColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTextStyles.textStyle19.copyWith(
                color: AppColors.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                                .copyWith(color: AppColors.accentColor),
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

                          return Text(
                            bottomData[value.toInt()],
                            style: AppTextStyles.textStyle15
                                .copyWith(color: AppColors.accentColor),
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
                    border: const Border(
                      bottom: BorderSide(
                        color: AppColors.accentColor,
                        width: 0.5,
                      ),
                      left: BorderSide(
                        color: AppColors.accentColor,
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
                      color: AppColors.accentColor,
                      barWidth: 4,
                      isStrokeCapRound: false,
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.accentColor.withOpacity(0.2),
                      ),
                      spots: spots,
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
      ),
    );
  }
}
