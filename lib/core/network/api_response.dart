import 'package:json_annotation/json_annotation.dart';

import '../error/app_error.dart';

/// Generic API response wrapper for all network calls.
part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  ApiResponse({this.data, this.error});
  final T? data;
  final AppError? error;

  bool get isSuccess => error == null;

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
      Object? Function(T value) toJsonT,
      ) =>
      _$ApiResponseToJson(this, toJsonT);
}