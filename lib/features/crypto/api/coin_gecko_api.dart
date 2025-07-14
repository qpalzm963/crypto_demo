import 'package:crypto_app/features/crypto/models/crypto_market/crypto_market.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'coin_gecko_api.g.dart';

@RestApi(baseUrl: 'https://api.coingecko.com/api/v3')
abstract class CoinGeckoApi {
  factory CoinGeckoApi(Dio dio, {String baseUrl}) = _CoinGeckoApi;

  @GET('/coins/markets')
  Future<List<CryptoMarket>> getTopMarkets({
    @Query('vs_currency') String vsCurrency = 'usd',
    @Query('order') String order = 'market_cap_desc',
    @Query('per_page') int perPage = 10,
    @Query('page') int page = 1,
    @Query('sparkline') bool sparkline = false,
    @Query('price_change_percentage')
    String priceChangePercentage = '1h,24h,7d,14d,30d,1y',
  });

  @GET('/coins/{id}/market_chart')
  Future<MarketChart> getMarketChart(
    @Path('id') String id, {
    @Query('vs_currency') String vsCurrency = 'usd',
    @Query('days') int days = 7, // 最近 7 天
  }); 
}
