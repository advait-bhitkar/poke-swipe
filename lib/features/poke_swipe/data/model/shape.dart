import 'package:json_annotation/json_annotation.dart';
part 'shape.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Shape {
  final String name;
  final String url;
  Shape({required this.name, required this.url});
  factory Shape.fromJson(Map<String, dynamic> json) => _$ShapeFromJson(json);
  Map<String, dynamic> toJson() => _$ShapeToJson(this);
}

