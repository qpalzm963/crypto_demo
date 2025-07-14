// lib/providers/finnhub_rest_provider.dart
import 'dart:convert';

import 'package:crypto_app/features/crypto/api/coin_gecko_api.dart';
import 'package:crypto_app/features/crypto/models/crypto_market/crypto_market.dart';
import 'package:crypto_app/features/crypto/providers/chart_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider((ref) {
  final dio = Dio();
  dio.options = BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),

    // Add logging interceptor for debugging
  );
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      logPrint: (obj) => print(obj),
    ),
  );
  return dio;
});

final coinGeckoApiProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return CoinGeckoApi(dio);
});

final topMarketsProvider = FutureProvider((ref) async {
  final api = ref.watch(coinGeckoApiProvider);
  return api.getTopMarkets(perPage: 10, sparkline: true);
});

final marketChartProvider = FutureProvider.family<MarketChart, String>((
  ref,
  coinId,
) async {
  final api = ref.read(coinGeckoApiProvider);
  final days = ref.watch(chartDaysProvider);
  final param = days == 999 ? 'max' : days.toString();
  return api.getMarketChart(coinId, days: int.parse(param));
});
