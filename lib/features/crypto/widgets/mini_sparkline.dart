import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MiniSparkline extends StatelessWidget {
  final List<double> prices;
  final bool isUp;

  const MiniSparkline({super.key, required this.prices, required this.isUp});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 30,
      child: SfSparkLineChart(
        data: prices,
        color: isUp ? Colors.green : Colors.red,
        axisLineWidth: 0,
        axisCrossesAt: 0,
        trackball: const SparkChartTrackball(
          activationMode: SparkChartActivationMode.tap,
        ),
      ),
    );
  }
}
