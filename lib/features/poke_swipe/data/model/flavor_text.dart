import 'package:json_annotation/json_annotation.dart';
import 'language.dart';
import 'version.dart';

part 'flavor_text.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FlavorText {
  @JsonKey(name: 'flavor_text')
  final String flavorText;
  final Language language;
  final Version version;
  FlavorText({required this.flavorText, required this.language, required this.version});
  factory FlavorText.fromJson(Map<String, dynamic> json) => _$FlavorTextFromJson(json);
  Map<String, dynamic> toJson() => _$FlavorTextToJson(this);
}

