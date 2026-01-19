import 'package:json_annotation/json_annotation.dart';
part 'version.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Version {
  final String name;
  final String url;
  Version({required this.name, required this.url});
  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);
  Map<String, dynamic> toJson() => _$VersionToJson(this);
}

