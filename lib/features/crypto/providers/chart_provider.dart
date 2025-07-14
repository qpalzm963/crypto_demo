import 'package:crypto_app/features/crypto/models/crypto_market/crypto_market.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chartDaysProvider = StateProvider<int>((ref) => 1);
final isKlineProvider = StateProvider<bool>((ref) => false);
final klineIntervalProvider = StateProvider<String>((ref) => '1h');
final klineProvider = FutureProvider.family<List<Kline>, String>((
  ref,
  symbol,
) async {
  final dio = Dio();
  final interval = ref.watch(klineIntervalProvider);
  final res = await dio.get(
    'https://api.binance.com/api/v3/klines',
    queryParameters: {'symbol': symbol, 'interval': interval, 'limit': 100},
  );
  return (res.data as List).map((e) => Kline.fromList(e)).toList();
});
