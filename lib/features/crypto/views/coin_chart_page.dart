import 'package:crypto_app/features/crypto/providers/coingecko_api_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CoinChartPage extends ConsumerWidget {
  final String coinId;
  final String coinName;

  const CoinChartPage({
    super.key,
    required this.coinId,
    required this.coinName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncChart = ref.watch(marketChartProvider(coinId));

    return Scaffold(
      appBar: AppBar(title: Text(coinName)),
      body: asyncChart.when(
        data: (chart) {
          final prices = chart.prices.map((e) => FlSpot(
            e[0].toDouble(), e[1].toDouble()
          )).toList();

          return Padding(
            padding: const EdgeInsets.all(16),
            child: LineChart(LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: prices,
                  isCurved: true,
                  dotData: FlDotData(show: false),
                  color: Colors.blue,
                ),
              ],
              titlesData: FlTitlesData(show: false),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
            )),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}