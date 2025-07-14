import 'package:crypto_app/features/crypto/providers/coingecko_api_provider.dart';
import 'package:crypto_app/features/crypto/widgets/coin_line_chart.dart';
import 'package:crypto_app/features/crypto/widgets/price_range_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CoinChartWidget extends HookConsumerWidget {
  final String coinId;

  const CoinChartWidget({super.key, required this.coinId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartAsync = ref.watch(marketChartProvider(coinId));
    return Column(
      children: [
        const TimeRangeTabs(),
        Expanded(
          child: chartAsync.when(
            data: (chart) => LineChartWidget(chart: chart), // 你的折線圖元件
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
          ),
        ),
      ],
    );
  }
}
