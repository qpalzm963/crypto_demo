import 'package:crypto_app/features/crypto/models/crypto_market/crypto_market.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends HookWidget {
  final MarketChart chart;
  const LineChartWidget({super.key, required this.chart});

  @override
  Widget build(BuildContext context) {
    // 組價格資料
    final pricePoints =
        chart.prices.map((e) {
          return _ChartPoint(
            DateTime.fromMillisecondsSinceEpoch(e[0].toInt()),
            e[1].toDouble(),
          );
        }).toList();

    // 組成交量資料
    final volumePoints =
        chart.volumes.map((e) {
          return _VolumePoint(
            DateTime.fromMillisecondsSinceEpoch(e[0].toInt()),
            e[1].toDouble(),
          );
        }).toList();

    final trackballBehavior = useMemoized(
      () => TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        tooltipSettings: const InteractiveTooltip(enable: true),
      ),
    );

    final zoomPanBehavior = useMemoized(
      () => ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
        zoomMode: ZoomMode.x,
        maximumZoomLevel: 0.2,
      ),
    );

    return SfCartesianChart(
      primaryXAxis: const DateTimeAxis(),
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat("#,##0.########"),
        axisLabelFormatter: (details) {
          final value = details.value;
          // 如果有小數點且小數部分不為0，就自動決定小數顯示長度（最多8位）
          String label;
          if (value is double && value != value.roundToDouble()) {
            // 小數位
            final decimalStr = value.toStringAsFixed(8);
            // 移除結尾多餘的 0
            label = double.parse(decimalStr).toString();
          } else {
            // 整數
            label = value.toStringAsFixed(0);
          }
          return ChartAxisLabel(label, null);
        },
      ),
      series: [
        // 1️⃣ 價格折線
        AreaSeries<_ChartPoint, DateTime>(
          dataSource: pricePoints,
          xValueMapper: (p, _) => p.time,
          yValueMapper: (p, _) => p.price,
          gradient: LinearGradient(
            colors: [Colors.blue.withOpacity(0.4), Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderColor: Colors.blue,
          borderWidth: 2,
        ),
        // 2️⃣ 成交量柱狀
        ColumnSeries<_VolumePoint, DateTime>(
          dataSource: volumePoints,
          xValueMapper: (p, _) => p.time,
          yValueMapper: (p, _) => p.volume,
          color: const Color.fromARGB(255, 73, 255, 56).withOpacity(0.6),
          yAxisName: 'volume',
        ),
      ],
      axes: [
        NumericAxis(
          name: 'volume',
          numberFormat: NumberFormat.compact(),
          opposedPosition: true,
          axisLabelFormatter: (details) => ChartAxisLabel('', null), // 隱藏右側數字
        ),
      ],
      trackballBehavior: trackballBehavior,
      zoomPanBehavior: zoomPanBehavior,
    );
  }
}

// 價格用的點
class _ChartPoint {
  final DateTime time;
  final double price;
  _ChartPoint(this.time, this.price);
}

// 成交量用的點
class _VolumePoint {
  final DateTime time;
  final double volume;
  _VolumePoint(this.time, this.volume);
}
