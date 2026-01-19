import 'package:json_annotation/json_annotation.dart';
part 'growth_rate.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GrowthRate {
  final String name;
  final String url;
  GrowthRate({required this.name, required this.url});
  factory GrowthRate.fromJson(Map<String, dynamic> json) => _$GrowthRateFromJson(json);
  Map<String, dynamic> toJson() => _$GrowthRateToJson(this);
}

