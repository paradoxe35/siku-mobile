// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Logged _$LoggedFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['token', 'auth', 'event']);
  return Logged(
    json['token'] as String,
    json['auth'] == null
        ? null
        : User.fromJson(json['auth'] as Map<String, dynamic>),
    json['event'] == null
        ? null
        : Event.fromJson(json['event'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoggedToJson(Logged instance) => <String, dynamic>{
      'token': instance.token,
      'auth': instance.auth,
      'event': instance.event,
    };
