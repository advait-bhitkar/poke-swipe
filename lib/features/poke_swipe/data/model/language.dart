import 'package:json_annotation/json_annotation.dart';
part 'language.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Language {
  final String name;
  final String url;
  Language({required this.name, required this.url});
  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

