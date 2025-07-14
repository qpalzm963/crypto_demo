// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoMarket _$CryptoMarketFromJson(Map<String, dynamic> json) => CryptoMarket(
  id: json['id'] as String,
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  currentPrice: (json['current_price'] as num?)?.toDouble(),
  marketCap: (json['market_cap'] as num?)?.toInt(),
  marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
  fullyDilutedValuation: (json['fully_diluted_valuation'] as num?)?.toInt(),
  totalVolume: (json['total_volume'] as num?)?.toInt(),
  high24h: (json['high_24h'] as num?)?.toDouble(),
  low24h: (json['low_24h'] as num?)?.toDouble(),
  priceChangePercentage24h:
      (json['price_change_percentage_24h'] as num?)?.toDouble(),
  marketCapChange24h: (json['market_cap_change_24h'] as num?)?.toInt(),
  marketCapChangePercentage24h:
      (json['market_cap_change_percentage_24h'] as num?)?.toDouble(),
  circulatingSupply: (json['circulating_supply'] as num?)?.toInt(),
  totalSupply: (json['total_supply'] as num?)?.toInt(),
  maxSupply: (json['max_supply'] as num?)?.toInt(),
  ath: (json['ath'] as num?)?.toInt(),
  athChangePercentage: (json['ath_change_percentage'] as num?)?.toDouble(),
  athDate:
      json['ath_date'] == null
          ? null
          : DateTime.parse(json['ath_date'] as String),
  atl: (json['atl'] as num?)?.toDouble(),
  atlChangePercentage: (json['atl_change_percentage'] as num?)?.toDouble(),
  atlDate:
      json['atl_date'] == null
          ? null
          : DateTime.parse(json['atl_date'] as String),
  roi: json['roi'],
  lastUpdated:
      json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
  sparklineIn7d:
      json['sparkline_in_7d'] == null
          ? null
          : SparklineData.fromJson(
            json['sparkline_in_7d'] as Map<String, dynamic>,
          ),
  priceChange1h:
      (json['price_change_percentage_1h_in_currency'] as num?)?.toDouble() ?? 0,
  priceChange7d:
      (json['price_change_percentage_7d_in_currency'] as num?)?.toDouble() ?? 0,
  priceChange14d:
      (json['price_change_percentage_14d_in_currency'] as num?)?.toDouble() ??
      0,
  priceChange24h: (json['price_change_24h'] as num?)?.toDouble() ?? 0.0,
  priceChange30d:
      (json['price_change_percentage_30d_in_currency'] as num?)?.toDouble(),
  priceChange1y:
      (json['price_change_percentage_1y_in_currency'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CryptoMarketToJson(CryptoMarket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'market_cap': instance.marketCap,
      'market_cap_rank': instance.marketCapRank,
      'sparkline_in_7d': instance.sparklineIn7d,
      'fully_diluted_valuation': instance.fullyDilutedValuation,
      'total_volume': instance.totalVolume,
      'high_24h': instance.high24h,
      'low_24h': instance.low24h,
      'price_change_24h': instance.priceChange24h,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'market_cap_change_24h': instance.marketCapChange24h,
      'market_cap_change_percentage_24h': instance.marketCapChangePercentage24h,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'max_supply': instance.maxSupply,
      'ath': instance.ath,
      'ath_change_percentage': instance.athChangePercentage,
      'ath_date': instance.athDate?.toIso8601String(),
      'atl': instance.atl,
      'atl_change_percentage': instance.atlChangePercentage,
      'atl_date': instance.atlDate?.toIso8601String(),
      'roi': instance.roi,
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'price_change_percentage_1h_in_currency': instance.priceChange1h,
      'price_change_percentage_7d_in_currency': instance.priceChange7d,
      'price_change_percentage_14d_in_currency': instance.priceChange14d,
      'price_change_percentage_30d_in_currency': instance.priceChange30d,
      'price_change_percentage_1y_in_currency': instance.priceChange1y,
    };

MarketChart _$MarketChartFromJson(Map<String, dynamic> json) => MarketChart(
  prices:
      (json['prices'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
);

Map<String, dynamic> _$MarketChartToJson(MarketChart instance) =>
    <String, dynamic>{'prices': instance.prices};

SparklineData _$SparklineDataFromJson(Map<String, dynamic> json) =>
    SparklineData(
      price:
          (json['price'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList(),
    );

Map<String, dynamic> _$SparklineDataToJson(SparklineData instance) =>
    <String, dynamic>{'price': instance.price};
