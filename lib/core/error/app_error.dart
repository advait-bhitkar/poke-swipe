import 'package:json_annotation/json_annotation.dart';

part 'app_error.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AppError {
  final String message;
  final String? code;
  final dynamic details;

  AppError({required this.message, this.code, this.details});

  factory AppError.fromJson(Map<String, dynamic> json) => _$AppErrorFromJson(json);
  Map<String, dynamic> toJson() => _$AppErrorToJson(this);

  @override
  String toString() => 'AppError(message: $message, code: $code, details: $details)';
}
