import 'package:crypto_app/features/crypto/models/crypto_market/crypto_market.dart';
import 'package:crypto_app/features/crypto/providers/coingecko_api_provider.dart';
import 'package:crypto_app/features/crypto/widgets/coin_line_chart.dart';
import 'package:crypto_app/features/crypto/widgets/price_range_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinDetailPage extends ConsumerWidget {
  final String coinId;
  final String coinName;
  final String symbol;
  final double currentPrice;
  final double priceChange24h;
  final double low24h;
  final double high24h;
  final double? h1, h24, d7, d14, d30, y1;
  const CoinDetailPage({
    super.key,
    required this.coinId,
    required this.symbol,
    required this.coinName,
    required this.currentPrice,
    required this.priceChange24h,
    required this.low24h,
    required this.high24h,
    this.d14 = 0,
    this.d7 = 0,
    this.h1 = 0,
    this.h24 = 0,
    this.d30 = 0,
    this.y1 = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncChart = ref.watch(marketChartProvider(coinId));

    final percentageChange = priceChange24h >= 0;
    final chartDays = ref.watch(chartDaysProvider);

    return Scaffold(
      appBar: AppBar(title: Text(coinName)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${currentPrice.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                '${priceChange24h.toStringAsFixed(2)}% (24h)',
                style: TextStyle(
                  color: percentageChange ? Colors.green : Colors.red,
                  fontSize: 16,
                ),
              ),
              Consumer(
                builder: (context, ref, _) {
                  final isKline = ref.watch(isKlineProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        icon: Icon(
                          isKline ? Icons.show_chart : Icons.candlestick_chart,
                        ),
                        label: Text(isKline ? '切換成 K 線' : '切換成折線'),
                        onPressed: () {
                          ref.read(isKlineProvider.notifier).state = !isKline;
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              PriceRangeBar(current: currentPrice, low: low24h, high: high24h),
              const SizedBox(height: 16),
              TimeRangeTabs(),
              const SizedBox(height: 16),
              Expanded(
                child: Consumer(
                  builder: (context, ref, _) {
                    final isKline = ref.watch(isKlineProvider);
                    if (isKline) {
                      final klineAsync = ref.watch(klineProvider('${symbol.toUpperCase()}USDT'));
                      return klineAsync.when(
                        data:
                            (klines) => SfCartesianChart(
                              primaryXAxis: DateTimeAxis(),
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
                              trackballBehavior: TrackballBehavior(
                                enable: true,
                              ),
                              zoomPanBehavior: ZoomPanBehavior(
                                enablePinching: true,
                                enablePanning: true,
                              ),
                            ),
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        error: (err, _) => Center(child: Text('Error: $err')),
                      );
                    } else {
                      final chartAsync = ref.watch(marketChartProvider(coinId));
                      return chartAsync.when(
                        data:
                            (chart) =>
                                CoinLineChart(prices: chart.prices), // 你的折線圖元件
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        error: (err, _) => Center(child: Text('Error: $err')),
                      );
                    }
                  },
                ),
              ),
              PriceChangeTable(
                h1: h1,
                h24: h24,
                d14: d14,
                d7: d7,
                y1: y1,
                d30: d30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceChangeTable extends StatelessWidget {
  final double? h1, h24, d7, d14, d30, y1;

  const PriceChangeTable({
    super.key,
    required this.h1,
    required this.h24,
    required this.d7,
    required this.d14,
    required this.d30,
    required this.y1,
  });

  Widget _buildItem(String label, double? value) {
    final isUp = (value ?? 0) >= 0;
    final text = value != null ? '${value.toStringAsFixed(2)}%' : '--';
    return Column(
      children: [
        Text(label),
        Text(text, style: TextStyle(color: isUp ? Colors.green : Colors.red)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // runSpacing: 8,
      children: [
        _buildItem('1h', h1),
        _buildItem('24h', h24),
        _buildItem('7d', d7),
        _buildItem('30d', d30),
        _buildItem('1y', y1),
      ],
    );
  }
}
