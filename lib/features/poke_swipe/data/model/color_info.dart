import 'package:json_annotation/json_annotation.dart';
part 'color_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ColorInfo {
  final String name;
  final String url;
  ColorInfo({required this.name, required this.url});
  factory ColorInfo.fromJson(Map<String, dynamic> json) => _$ColorInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ColorInfoToJson(this);
}

