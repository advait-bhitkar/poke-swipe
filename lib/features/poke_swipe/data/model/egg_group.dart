import 'package:json_annotation/json_annotation.dart';
part 'egg_group.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EggGroup {
  final String name;
  final String url;
  EggGroup({required this.name, required this.url});
  factory EggGroup.fromJson(Map<String, dynamic> json) => _$EggGroupFromJson(json);
  Map<String, dynamic> toJson() => _$EggGroupToJson(this);
}

