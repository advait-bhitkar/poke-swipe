import 'package:json_annotation/json_annotation.dart';
part 'habitat.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Habitat {
  final String? name;
  final String? url;
  Habitat({this.name, this.url});
  factory Habitat.fromJson(Map<String, dynamic> json) => _$HabitatFromJson(json);
  Map<String, dynamic> toJson() => _$HabitatToJson(this);
}

