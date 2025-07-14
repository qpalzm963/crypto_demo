import 'package:crypto_app/features/crypto/models/crypto_market/crypto_market.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class KLineChart extends HookConsumerWidget {
  final List<Kline> klines;

  const KLineChart({super.key, required this.klines});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trackballBehavior = useMemoized(() {
      return TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        tooltipSettings: const InteractiveTooltip(
          enable: true,
          format:
              'point.x\n開:\$point.open\n高:\$point.high\n低:\$point.low\n收:\$point.close',
        ),
      );
    });
    final zoomPanBehavior = useMemoized(
      () => ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
        zoomMode: ZoomMode.x,
        maximumZoomLevel: 0.2,
      ),
    );
    return SfCartesianChart(
      zoomPanBehavior: zoomPanBehavior,
      primaryXAxis: DateTimeAxis(),
      primaryYAxis: NumericAxis(),
      series: <CandleSeries<Kline, DateTime>>[
        CandleSeries<Kline, DateTime>(
          dataSource: klines,
          xValueMapper: (k, _) => k.openTime,
          lowValueMapper: (k, _) => k.low,
          highValueMapper: (k, _) => k.high,
          openValueMapper: (k, _) => k.open,
          closeValueMapper: (k, _) => k.close,
        ),
      ],
      trackballBehavior: trackballBehavior,
    );
  }
}
