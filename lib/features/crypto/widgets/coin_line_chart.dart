import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinLineChart extends StatefulWidget {
  final List<List<num>> prices;

  const CoinLineChart({super.key, required this.prices});

  @override
  State<CoinLineChart> createState() => _CoinLineChartState();
}

class _ChartPoint {
  final DateTime time;
  final double price;

  _ChartPoint(this.time, this.price);
}

class _CoinLineChartState extends State<CoinLineChart> {
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: const InteractiveTooltip(
        enable: true,
        format: 'point.x : \$point.y',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.prices.map((e) {
      final timestamp = DateTime.fromMillisecondsSinceEpoch(e[0].toInt());
      return _ChartPoint(timestamp, e[1].toDouble());
    }).toList();

    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      primaryYAxis: NumericAxis(),
      series: [
        AreaSeries<_ChartPoint, DateTime>(
          dataSource: data,
          xValueMapper: (_ChartPoint point, _) => point.time,
          yValueMapper: (_ChartPoint point, _) => point.price,
          gradient: LinearGradient(
            colors: [Colors.red.withOpacity(0.4), Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderColor: Colors.red,
          borderWidth: 2,
        ),
      ],
      trackballBehavior: _trackballBehavior,
    );
  }
}