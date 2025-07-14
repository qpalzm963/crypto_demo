import 'package:json_annotation/json_annotation.dart';

part 'crypto_market.g.dart';

@JsonSerializable()
class CryptoMarket {
  String id;
  String symbol;
  String name;
  String image;
  @JsonKey(name: 'current_price')
  double? currentPrice;
  @JsonKey(name: 'market_cap')
  int? marketCap;
  @JsonKey(name: 'market_cap_rank')
  int? marketCapRank;
  @JsonKey(name: 'sparkline_in_7d')
  final SparklineData? sparklineIn7d;
  @JsonKey(name: 'fully_diluted_valuation')
  int? fullyDilutedValuation;
  @JsonKey(name: 'total_volume')
  int? totalVolume;
  @JsonKey(name: 'high_24h')
  double? high24h;
  @JsonKey(name: 'low_24h')
  double? low24h;
  @JsonKey(name: 'price_change_24h')
  double? priceChange24h;
  @JsonKey(name: 'price_change_percentage_24h')
  double? priceChangePercentage24h;
  @JsonKey(name: 'market_cap_change_24h')
  int? marketCapChange24h;
  @JsonKey(name: 'market_cap_change_percentage_24h')
  double? marketCapChangePercentage24h;
  @JsonKey(name: 'circulating_supply')
  int? circulatingSupply;
  @JsonKey(name: 'total_supply')
  int? totalSupply;
  @JsonKey(name: 'max_supply')
  int? maxSupply;
  int? ath;
  @JsonKey(name: 'ath_change_percentage')
  double? athChangePercentage;
  @JsonKey(name: 'ath_date')
  DateTime? athDate;
  double? atl;
  @JsonKey(name: 'atl_change_percentage')
  double? atlChangePercentage;
  @JsonKey(name: 'atl_date')
  DateTime? atlDate;
  dynamic roi;
  @JsonKey(name: 'last_updated')
  DateTime? lastUpdated;
  @JsonKey(name: 'price_change_percentage_1h_in_currency')
  final double? priceChange1h;

  @JsonKey(name: 'price_change_percentage_7d_in_currency')
  final double? priceChange7d;

  @JsonKey(name: 'price_change_percentage_14d_in_currency')
  final double? priceChange14d;

  @JsonKey(name: 'price_change_percentage_30d_in_currency')
  final double? priceChange30d;

  @JsonKey(name: 'price_change_percentage_1y_in_currency')
  final double? priceChange1y;

  CryptoMarket({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
    this.sparklineIn7d,
    this.priceChange1h = 0,
    this.priceChange7d = 0,
    this.priceChange14d = 0,
    this.priceChange24h = 0.0,
    this.priceChange30d,
    this.priceChange1y,
  });

  factory CryptoMarket.fromJson(Map<String, dynamic> json) {
    return _$CryptoMarketFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CryptoMarketToJson(this);
}

@JsonSerializable()
class MarketChart {
  final List<List<num>> prices;
  @JsonKey(name: 'total_volumes')
  final List<List<num>> volumes;

  MarketChart({required this.prices, required this.volumes});


  factory MarketChart.fromJson(Map<String, dynamic> json) =>
      _$MarketChartFromJson(json);

  Map<String, dynamic> toJson() => _$MarketChartToJson(this);
}

@JsonSerializable()
class SparklineData {
  final List<double> price;

  SparklineData({required this.price});

  factory SparklineData.fromJson(Map<String, dynamic> json) =>
      _$SparklineDataFromJson(json);

  Map<String, dynamic> toJson() => _$SparklineDataToJson(this);
}
class OhlcPoint {
  final DateTime time;
  final double open, high, low, close;

  OhlcPoint({
    required this.time,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });
}
class Kline {
  final DateTime openTime;
  final double open, high, low, close, volume;

  Kline({
    required this.openTime,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  factory Kline.fromList(List<dynamic> list) {
    return Kline(
      openTime: DateTime.fromMillisecondsSinceEpoch(list[0]),
      open: double.parse(list[1]),
      high: double.parse(list[2]),
      low: double.parse(list[3]),
      close: double.parse(list[4]),
      volume: double.parse(list[5]),  // 第 6 個
    );
  }
}