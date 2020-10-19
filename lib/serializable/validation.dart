import 'package:json_annotation/json_annotation.dart';
import 'package:siku/serializable/attends.dart';

part 'validation.g.dart';

@JsonSerializable()
class Validation {
  Validation(
    this.message,
    this.data,
    this.status,
  );

  @JsonKey(required: true)
  String message;

  @JsonKey(required: true)
  int status;

  @JsonKey(required: true)
  Attend data;

  factory Validation.fromJson(Map<String, dynamic> json) =>
      _$ValidationFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationToJson(this);
}
