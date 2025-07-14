import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coins.g.dart';

@JsonSerializable()
class Coins {
  String? id;
  String? symbol;
  String? name;
  String? image;
  @JsonKey(name: 'current_price')
  int? currentPrice;
  @JsonKey(name: 'market_cap')
  int? marketCap;
  @JsonKey(name: 'market_cap_rank')
  int? marketCapRank;
  @JsonKey(name: 'fully_diluted_valuation')
  int? fullyDilutedValuation;
  @JsonKey(name: 'total_volume')
  int? totalVolume;
  @JsonKey(name: 'high_24h')
  int? high24h;
  @JsonKey(name: 'low_24h')
  int? low24h;
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

  Coins({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
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
  });

  factory Coins.fromJson(Map<String, dynamic> json) => _$CoinsFromJson(json);

  Map<String, dynamic> toJson() => _$CoinsToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Coins) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      symbol.hashCode ^
      name.hashCode ^
      image.hashCode ^
      currentPrice.hashCode ^
      marketCap.hashCode ^
      marketCapRank.hashCode ^
      fullyDilutedValuation.hashCode ^
      totalVolume.hashCode ^
      high24h.hashCode ^
      low24h.hashCode ^
      priceChange24h.hashCode ^
      priceChangePercentage24h.hashCode ^
      marketCapChange24h.hashCode ^
      marketCapChangePercentage24h.hashCode ^
      circulatingSupply.hashCode ^
      totalSupply.hashCode ^
      maxSupply.hashCode ^
      ath.hashCode ^
      athChangePercentage.hashCode ^
      athDate.hashCode ^
      atl.hashCode ^
      atlChangePercentage.hashCode ^
      atlDate.hashCode ^
      roi.hashCode ^
      lastUpdated.hashCode;
}
