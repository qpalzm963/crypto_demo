import 'package:crypto_app/features/crypto/providers/chart_provider.dart';
import 'package:crypto_app/features/crypto/widgets/kline_chart_widget.dart';
import 'package:crypto_app/features/crypto/widgets/coin_chart_widget.dart';
import 'package:crypto_app/features/crypto/widgets/price_range_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CoinDetailPage extends ConsumerWidget {
  final String coinId;
  final String coinName;
  final String symbol;
  final double currentPrice;
  final double priceChange24h;
  final double low24h;
  final double high24h;
  final int vol;
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
    this.vol = 0,
    this.d30 = 0,
    this.y1 = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final percentageChange = priceChange24h >= 0;

    return Scaffold(
      appBar: AppBar(title: Text(coinName)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '\$${currentPrice.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, _) {
                      final isKline = ref.watch(isKlineProvider);
                      return IconButton(
                        icon: Icon(
                          isKline ? Icons.show_chart : Icons.candlestick_chart,
                        ),
                        // label: Text(!isKline ? '切換成 K 線' : '切換成折線'),
                        onPressed: () {
                          ref.read(isKlineProvider.notifier).state = !isKline;
                        },
                      );
                    },
                  ),
                ],
              ),
              Text(
                '${priceChange24h.toStringAsFixed(2)}% (24h)',
                style: TextStyle(
                  color: percentageChange ? Colors.green : Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: PriceRangeBar(
                      current: currentPrice,
                      low: low24h,
                      high: high24h,
                      vol: vol,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Consumer(
                  builder: (context, ref, _) {
                    final isKline = ref.watch(isKlineProvider);
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child:
                          isKline
                              ? KlineChartView(
                                key: const ValueKey('kline'),
                                symbol: symbol,
                              )
                              : CoinChartWidget(
                                key: const ValueKey('line'),
                                coinId: coinId,
                              ),
                    );
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
