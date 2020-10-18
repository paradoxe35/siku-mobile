// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['data']);
  return UserData(
    json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'data': instance.data,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['id', 'username', 'name', 'phone', 'sended_sms']);
  return User(
    json['id'] as int,
    json['name'] as String,
    json['phone'] as String,
    json['sended_sms'] as bool,
    json['username'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'phone': instance.phone,
      'sended_sms': instance.sendedSms,
    };
