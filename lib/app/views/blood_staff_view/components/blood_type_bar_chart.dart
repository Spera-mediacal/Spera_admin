import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class BloodLinesChart extends StatelessWidget {
  const BloodLinesChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.greyColor.withOpacity(0.6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          (screenHeight(context) * 0.02).sh,
          const Expanded(
            child: BloodTypeBarChart(),
          ),
        ],
      ),
    );
  }
}

class BloodTypeBarChart extends StatefulWidget {
  const BloodTypeBarChart({super.key});

  @override
  State<StatefulWidget> createState() => BloodTypeBarChartState();
}

class BloodTypeBarChartState extends State<BloodTypeBarChart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];
  final List<double> quantities = [10, 12, 15, 8, 9, 14, 7, 11];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Yearly',
                style: AppTextStyles.textStyle35
                    .copyWith(color: AppColors.accentColor),
              ),
              (screenHeight(context) * 0.01).sh,
              Text(
                'Blood Type Distribution',
                style: AppTextStyles.textStyle35
                    .copyWith(color: AppColors.accentColor),
              ),
              (screenHeight(context) * 0.03).sh,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BarChart(mainBarData()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    final gradient = LinearGradient(
      colors: [
        AppColors.accentColor.withOpacity(0.8),
        AppColors.accentColor.withOpacity(0.2),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          gradient: gradient,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: AppColors.accentColor.withOpacity(0.1),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(quantities.length, (i) {
      return makeGroupData(
        i,
        quantities[i],
        barColor: AppColors.accentColor,
      );
    });
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toStringAsFixed(0),
                style: AppTextStyles.textStyle15
                    .copyWith(color: AppColors.accentColor),
              );
            },
            interval: 5,
            reservedSize: 20,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              final index = value.toInt();
              if (index >= 0 && index < bloodTypes.length) {
                return Text(bloodTypes[index],
                    style: AppTextStyles.textStyle15
                        .copyWith(color: AppColors.accentColor));
              }
              return const SizedBox.shrink();
            },
            reservedSize: 40,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }
}
