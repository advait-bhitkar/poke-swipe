import 'package:json_annotation/json_annotation.dart';
part 'species.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Species {
  final String name;
  final String url;
  Species({required this.name, required this.url});
  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}

