// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attends.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attends _$AttendsFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['data']);
  return Attends(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Attend.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AttendsToJson(Attends instance) => <String, dynamic>{
      'data': instance.data,
    };

Attend _$AttendFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['id', 'guest', 'validator', 'created_at']);
  return Attend(
    json['id'] as int,
    json['created_at'] as String,
    json['guest'] == null
        ? null
        : Guest.fromJson(json['guest'] as Map<String, dynamic>),
    json['validator'] == null
        ? null
        : User.fromJson(json['validator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AttendToJson(Attend instance) => <String, dynamic>{
      'id': instance.id,
      'guest': instance.guest,
      'validator': instance.validator,
      'created_at': instance.createdAt,
    };

Guest _$GuestFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'name', 'phone', 'autorized']);
  return Guest()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..phone = json['phone'] as String
    ..autorized = json['autorized'] as int;
}

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'autorized': instance.autorized,
    };
