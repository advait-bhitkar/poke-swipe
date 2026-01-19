import 'package:json_annotation/json_annotation.dart';
part 'generation.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Generation {
  final String name;
  final String url;
  Generation({required this.name, required this.url});
  factory Generation.fromJson(Map<String, dynamic> json) => _$GenerationFromJson(json);
  Map<String, dynamic> toJson() => _$GenerationToJson(this);
}

