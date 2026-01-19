import 'package:json_annotation/json_annotation.dart';
part 'pokedex.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Pokedex {
  final String name;
  final String url;
  Pokedex({required this.name, required this.url});
  factory Pokedex.fromJson(Map<String, dynamic> json) => _$PokedexFromJson(json);
  Map<String, dynamic> toJson() => _$PokedexToJson(this);
}

