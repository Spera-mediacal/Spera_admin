import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class BloodLinesChart extends StatelessWidget {
  const BloodLinesChart({
    super.key,
    required this.aPos,
    required this.aNeg,
    required this.bPos,
    required this.bNeg,
    required this.oPos,
    required this.oNeg,
    required this.abPos,
    required this.abNeg,
  });

  final int aPos;
  final int aNeg;
  final int bPos;
  final int bNeg;
  final int oPos;
  final int oNeg;
  final int abPos;
  final int abNeg;

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
          Expanded(
            child: BloodTypeBarChart(
                aPos: aPos,
                aNeg: aNeg,
                bPos: bPos,
                bNeg: bNeg,
                oPos: oPos,
                oNeg: oNeg,
                abPos:abPos,
                abNeg:abNeg,
            ),
          ),
        ],
      ),
    );
  }
}

class BloodTypeBarChart extends StatefulWidget {
  const BloodTypeBarChart({
    super.key,
    required this.aPos,
    required this.aNeg,
    required this.bPos,
    required this.bNeg,
    required this.oPos,
    required this.oNeg,
    required this.abPos,
    required this.abNeg,
  });

  final int aPos;
  final int aNeg;
  final int bPos;
  final int bNeg;
  final int oPos;
  final int oNeg;
  final int abPos;
  final int abNeg;

  @override
  State<StatefulWidget> createState() => BloodTypeBarChartState();
}

class BloodTypeBarChartState extends State<BloodTypeBarChart> {

  final Duration animDuration = const Duration(seconds: 4);

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

  late List<double> quantities;

  @override
  void initState() {
    super.initState();
    quantities = [
      widget.aPos.toDouble(),
      widget.aNeg.toDouble(),
      widget.bPos.toDouble(),
      widget.bNeg.toDouble(),
      widget.oPos.toDouble(),
      widget.oNeg.toDouble(),
      widget.abPos.toDouble(),
      widget.abNeg.toDouble(),
    ];
  }

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
                'yearly'.tr,
                style: AppTextStyles.textStyle35.copyWith(color: AppColors.accentColor),
              ),
              (screenHeight(context) * 0.01).sh,
              Text(
                'bloodTypeDistribution'.tr,
                style: AppTextStyles.textStyle35.copyWith(color: AppColors.accentColor),
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


  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(enabled: true),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toStringAsFixed(0),
                style: AppTextStyles.textStyle15.copyWith(color: AppColors.accentColor),
              );
            },
            interval: 3,
            reservedSize: 25,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              final index = value.toInt();
              if (index >= 0 && index < bloodTypes.length) {
                return Text(bloodTypes[index], style: AppTextStyles.textStyle15.copyWith(color: AppColors.accentColor));
              }
              return const SizedBox.shrink();
            },
            reservedSize: 40,
          ),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: false),
      barGroups: [
        makeGroupData(
          0,
          widget.aPos.toDouble(),
          barColor: AppColors.accentColor,
        ),makeGroupData(
          1,
          widget.aNeg.toDouble(),
          barColor: AppColors.accentColor,
        ),makeGroupData(
          2,
          widget.bPos.toDouble(),
          barColor: AppColors.accentColor,
        ),makeGroupData(
          3,
          widget.bNeg.toDouble(),
          barColor: AppColors.accentColor,
        ),makeGroupData(
          4,
          widget.oPos.toDouble(),
          barColor: AppColors.accentColor,
        ),makeGroupData(
          5,
          widget.oNeg.toDouble(),
          barColor: AppColors.accentColor,
        ),makeGroupData(
          6,
          widget.abPos.toDouble(),
          barColor: AppColors.accentColor,
        ), makeGroupData(
          7,
          widget.abNeg.toDouble(),
          barColor: AppColors.accentColor,
        ),
      ],
      gridData: const FlGridData(show: false),
    );
  }
}
