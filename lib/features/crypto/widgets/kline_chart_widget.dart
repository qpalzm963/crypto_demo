import 'package:crypto_app/features/crypto/models/crypto_market/crypto_market.dart';
import 'package:crypto_app/features/crypto/providers/chart_provider.dart';
import 'package:crypto_app/features/crypto/widgets/interval_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class KlineChartView extends HookConsumerWidget {
  final String symbol;
  const KlineChartView({super.key, required this.symbol});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final klineAsync = ref.watch(klineProvider('${symbol.toUpperCase()}USDT'));

    // 狀態保存目前選中的 K 棒
    final selectedKline = useState<Kline?>(null);

    return Column(
      children: [
        const IntervalSelector(),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            klineAsync.when(
              data:
                  (klines) => Column(
                    children: [
                      SfCartesianChart(
                        primaryXAxis: const DateTimeAxis(),
                        primaryYAxis: NumericAxis(
                          numberFormat: NumberFormat("#,##0.########"),
                        ),
                        series: [
                          CandleSeries<Kline, DateTime>(
                            dataSource: klines,
                            xValueMapper: (k, _) => k.openTime,
                            lowValueMapper: (k, _) => k.low,
                            highValueMapper: (k, _) => k.high,
                            openValueMapper: (k, _) => k.open,
                            closeValueMapper: (k, _) => k.close,
                          ),
                          // 2. 成交量（Volume）
                          ColumnSeries<Kline, DateTime>(
                            dataSource: klines,
                            xValueMapper: (k, _) => k.openTime,
                            yValueMapper: (k, _) => k.volume,
                            color: Colors.blue.withOpacity(0.5),
                            yAxisName: 'volume', // 這裡可以自訂副軸
                          ),
                        ],
                        onChartTouchInteractionUp: (_) {
                          // 清除選中的 K 棒
                          selectedKline.value = null;
                        },
                        axes: const <ChartAxis>[
                          NumericAxis(
                            name: 'volume',
                            opposedPosition: true,
                            majorGridLines: MajorGridLines(width: 0),
                            interval: 10000, // 你可以根據實際調整
                            isVisible: false,
                          ),
                        ],
                        onTrackballPositionChanging: (args) {
                          final chartPoint = args.chartPointInfo;
                          final int? dataIndex = chartPoint.dataPointIndex;
                          if (dataIndex != null &&
                              dataIndex >= 0 &&
                              dataIndex < klines.length) {
                            selectedKline.value = klines[dataIndex];
                          }
                        },
                        trackballBehavior: TrackballBehavior(enable: true),
                        zoomPanBehavior: ZoomPanBehavior(
                          enablePinching: true,
                          enablePanning: true,
                        ),
                      ),
                    ],
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error: $err')),
            ),
            // selectedKline.value != null
            //     ? Positioned(
            //       bottom: 0,
            //       child: Container(
            //         alignment: Alignment.center,
            //         width: 100,
            //         height: 50,
            //         color: Colors.black.withOpacity(0.8),
            //         child: Text(
            //           ' ${selectedKline.value!.openTime}',
            //           style: const TextStyle(fontSize: 14, color: Colors.white),
            //         ),
            //       ),
            //     )
            //     : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
