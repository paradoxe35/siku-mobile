import 'package:json_annotation/json_annotation.dart';
import 'package:siku/serializable/event.dart';
import 'package:siku/serializable/user.dart';

part 'logged.g.dart';

@JsonSerializable()
class Logged {
  Logged(
    this.token,
    this.auth,
    this.event,
  );

  @JsonKey(required: true)
  String token;

  @JsonKey(required: true)
  User auth;

  @JsonKey(required: true)
  Event event;

  factory Logged.fromJson(Map<String, dynamic> json) => _$LoggedFromJson(json);

  Map<String, dynamic> toJson() => _$LoggedToJson(this);
}
