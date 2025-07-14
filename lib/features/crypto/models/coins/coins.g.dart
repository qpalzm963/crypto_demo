// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coins _$CoinsFromJson(Map<String, dynamic> json) => Coins(
  id: json['id'] as String?,
  symbol: json['symbol'] as String?,
  name: json['name'] as String?,
  image: json['image'] as String?,
  currentPrice: (json['current_price'] as num?)?.toInt(),
  marketCap: (json['market_cap'] as num?)?.toInt(),
  marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
  fullyDilutedValuation: (json['fully_diluted_valuation'] as num?)?.toInt(),
  totalVolume: (json['total_volume'] as num?)?.toInt(),
  high24h: (json['high_24h'] as num?)?.toInt(),
  low24h: (json['low_24h'] as num?)?.toInt(),
  priceChange24h: (json['price_change_24h'] as num?)?.toDouble(),
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
);

Map<String, dynamic> _$CoinsToJson(Coins instance) => <String, dynamic>{
  'id': instance.id,
  'symbol': instance.symbol,
  'name': instance.name,
  'image': instance.image,
  'current_price': instance.currentPrice,
  'market_cap': instance.marketCap,
  'market_cap_rank': instance.marketCapRank,
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
};
