// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedData _$PaginatedDataFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['data', 'links', 'meta']);
  return PaginatedData(
    json['data'] as List,
    json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>),
    json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PaginatedDataToJson(PaginatedData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['first', 'last', 'prev', 'next']);
  return Links(
    json['first'] as String,
    json['last'] as String,
    json['next'] as String,
    json['prev'] as String,
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'current_page',
    'from',
    'last_page',
    'path',
    'per_page',
    'to',
    'total'
  ]);
  return Meta(
    json['current_page'] as int,
    json['from'] as int,
    json['last_page'] as int,
    json['path'] as String,
    json['per_page'] as int,
    json['to'] as int,
    json['total'] as int,
  );
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };
