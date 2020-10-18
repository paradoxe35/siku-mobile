import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  Event(
    this.id,
    this.active,
    this.createdAt,
    this.eventDate,
    this.guests,
    this.hash,
    this.isPublic,
    this.name,
    this.price,
    this.route,
  );

  @JsonKey(required: true)
  int id;

  @JsonKey(required: true)
  String name;

  @JsonKey(required: true)
  String route;

  @JsonKey(required: true)
  double price;

  @JsonKey(required: true)
  bool active;

  @JsonKey(required: true)
  String hash;

  @JsonKey(required: true)
  int guests;

  @JsonKey(required: true, name: 'is_public')
  bool isPublic;

  @JsonKey(required: true, name: 'event_date')
  String eventDate;

  @JsonKey(required: true, name: 'created_at')
  String createdAt;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
