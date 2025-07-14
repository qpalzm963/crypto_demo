import 'package:crypto_app/features/crypto/providers/chart_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PriceRangeBar extends StatelessWidget {
  final double current, low, high;
  final int vol;

  const PriceRangeBar({
    super.key,
    required this.current,
    required this.low,
    required this.high,
    required this.vol,
  });

  @override
  Widget build(BuildContext context) {
    final percent = ((current - low) / (high - low)).clamp(0.0, 1.0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Low'),
            Text('\$${low.toStringAsFixed(2)}'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('High'),
            Text('\$${high.toStringAsFixed(2)}'),
          ],
        ), Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Vol'),
            Text('\$${vol.toStringAsFixed(2)}'),
          ],
        ),
      ],
    );
  }
}

class TimeRangeTabs extends ConsumerWidget {
  const TimeRangeTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(chartDaysProvider);
    final options = {1: '24h', 7: '7d', 30: '1m', 90: '3m', 365: '1y'};

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 226, 224, 239),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            options.entries.map((entry) {
              final isActive =
                  selected == entry.key || (selected == 999 && entry.key == -1);
              return ChoiceChip(
                selectedColor: const Color.fromARGB(255, 255, 237, 237),
                disabledColor: const Color.fromARGB(0, 207, 44, 44),
                shadowColor: const Color.fromARGB(0, 142, 196, 67),
                backgroundColor: const Color.fromARGB(0, 249, 33, 33),
                label: Text(entry.value),
                selected: isActive,
                onSelected: (_) {
                  ref.read(chartDaysProvider.notifier).state =
                      entry.key == -1 ? 999 : entry.key;
                },
              );
            }).toList(),
      ),
    );
  }
}
