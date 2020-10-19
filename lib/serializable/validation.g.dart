// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Validation _$ValidationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['message', 'status', 'data']);
  return Validation(
    json['message'] as String,
    json['data'] == null
        ? null
        : Attend.fromJson(json['data'] as Map<String, dynamic>),
    json['status'] as int,
  );
}

Map<String, dynamic> _$ValidationToJson(Validation instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
