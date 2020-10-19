// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'id',
    'name',
    'route',
    'price',
    'active',
    'hash',
    'guests',
    'is_public',
    'event_date',
    'created_at'
  ]);
  return Event(
    json['id'] as int,
    json['active'] as bool,
    json['created_at'] as String,
    json['event_date'] as String,
    json['guests'] as int,
    json['hash'] as String,
    json['is_public'] as bool,
    json['name'] as String,
    (json['price'] as num)?.toDouble(),
    json['route'] as String,
    json['admin'] == null
        ? null
        : Admin.fromJson(json['admin'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'route': instance.route,
      'price': instance.price,
      'active': instance.active,
      'hash': instance.hash,
      'guests': instance.guests,
      'is_public': instance.isPublic,
      'event_date': instance.eventDate,
      'created_at': instance.createdAt,
      'admin': instance.admin?.toJson(),
    };

Admin _$AdminFromJson(Map<String, dynamic> json) {
  return Admin(
    json['email'] as String,
    json['phone'] as String,
  );
}

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
    };
