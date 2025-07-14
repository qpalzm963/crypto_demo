import 'package:crypto_app/features/crypto/providers/coingecko_api_provider.dart';
import 'package:crypto_app/features/crypto/views/coin_detail.page.dart';
import 'package:crypto_app/features/crypto/widgets/mini_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMarkets = ref.watch(topMarketsProvider);

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 30),
            const SizedBox(
              height: 80,
              child: Text("\$ 7,411,5", style: TextStyle(fontSize: 30)),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Assets'),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: asyncMarkets.when(
                          data:
                              (coins) => ListView.builder(
                                itemCount: coins.length,
                                itemBuilder: (context, index) {
                                  final coin = coins[index];
                                  final isUp =
                                      (coin.priceChangePercentage24h ?? 0) >= 0;

                                  return ListTile(
                                    leading: Image.network(
                                      coin.image,
                                      width: 32,
                                    ),
                                    title: Text(
                                      '${coin.name} (${coin.symbol.toUpperCase()})',
                                    ),
                                    subtitle: Text(
                                      'USD ${coin.currentPrice?.toStringAsFixed(2)}',
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Consumer(
                                          builder: (context, ref, _) {
                                            final prices =
                                                coin.sparklineIn7d?.price ?? [];
                                            return MiniSparkline(
                                              prices: prices,
                                              isUp:
                                                  (coin.priceChangePercentage24h ??
                                                      0) >=
                                                  0,
                                            );
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '${coin.priceChangePercentage24h?.toStringAsFixed(2)}%',
                                          style: TextStyle(
                                            color:
                                                isUp
                                                    ? Colors.green
                                                    : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) => CoinDetailPage(
                                                coinId: coin.id,
                                                symbol: coin.symbol,
                                                coinName: coin.name,
                                                currentPrice:
                                                    coin.currentPrice ?? 0,
                                                priceChange24h:
                                                    coin.priceChange24h ?? 0,
                                                low24h: coin.low24h ?? 0,
                                                high24h: coin.high24h ?? 0,
                                                d14: coin.priceChange14d ?? 0,
                                                d7: coin.priceChange7d ?? 0,
                                                h1: coin.priceChange1h ?? 0,
                                                h24: coin.priceChange24h ?? 0,
                                                d30: coin.priceChange30d ?? 0,
                                                y1: coin.priceChange1y ?? 0,
                                                vol: coin.totalVolume ?? 0,
                                              ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                          loading:
                              () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          error: (err, _) => Center(child: Text('Error: $err')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
