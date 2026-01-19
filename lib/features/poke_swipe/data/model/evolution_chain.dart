import 'package:json_annotation/json_annotation.dart';
part 'evolution_chain.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EvolutionChain {
  final String url;
  EvolutionChain({required this.url});
  factory EvolutionChain.fromJson(Map<String, dynamic> json) => _$EvolutionChainFromJson(json);
  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);
}

