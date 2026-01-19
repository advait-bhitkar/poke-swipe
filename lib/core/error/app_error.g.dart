// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppError _$AppErrorFromJson(Map<String, dynamic> json) => AppError(
  message: json['message'] as String,
  code: json['code'] as String?,
  details: json['details'],
);

Map<String, dynamic> _$AppErrorToJson(AppError instance) => <String, dynamic>{
  'message': instance.message,
  'code': instance.code,
  'details': instance.details,
};
