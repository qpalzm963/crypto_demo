import 'package:crypto_app/features/crypto/providers/chart_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IntervalSelector extends ConsumerWidget {
  const IntervalSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(klineIntervalProvider);
    final options = ['1m', '5m', '1h', '1d', '1w'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 226, 224, 239),
      ),
      child: Wrap(
        spacing: 8,
        children:
            options.map((option) {
              final isSelected = selected == option;
              return ChoiceChip(
                selectedColor: const Color.fromARGB(255, 255, 237, 237),
                disabledColor: const Color.fromARGB(0, 207, 44, 44),
                shadowColor: const Color.fromARGB(0, 142, 196, 67),
                backgroundColor: const Color.fromARGB(0, 249, 33, 33),
                label: Text(option),
                selected: isSelected,
                onSelected: (_) {
                  ref.read(klineIntervalProvider.notifier).state = option;
                },
              );
            }).toList(),
      ),
    );
  }
}
