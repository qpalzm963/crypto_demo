import 'package:crypto_app/features/crypto/providers/coingecko_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IntervalSelector extends ConsumerWidget {
  const IntervalSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(klineIntervalProvider);
    final options = ['1m', '5m', '15m', '1h', '4h', '1d', '1w'];

    return Wrap(
      spacing: 8,
      children: options.map((option) {
        final isSelected = selected == option;
        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (_) {
            ref.read(klineIntervalProvider.notifier).state = option;
          },
        );
      }).toList(),
    );
  }
}