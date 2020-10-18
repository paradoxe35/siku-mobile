import 'package:json_annotation/json_annotation.dart';
import 'package:siku/serializable/user.dart';

part 'attends.g.dart';

@JsonSerializable()
class Attends {
  Attends(this.data);

  @JsonKey(required: true)
  List<Attend> data;

  factory Attends.fromJson(Map<String, dynamic> json) =>
      _$AttendsFromJson(json);

  Map<String, dynamic> toJson() => _$AttendsToJson(this);
}

@JsonSerializable()
class Attend {
  Attend(this.id, this.createdAt, this.guest, this.validator);

  @JsonKey(required: true)
  int id;

  @JsonKey(required: true)
  Guest guest;

  @JsonKey(required: true)
  User validator;

  @JsonKey(required: true, name: 'created_at')
  String createdAt;

  factory Attend.fromJson(Map<String, dynamic> json) => _$AttendFromJson(json);

  Map<String, dynamic> toJson() => _$AttendToJson(this);
}

@JsonSerializable()
class Guest {
  Guest();

  @JsonKey(required: true)
  int id;

  @JsonKey(required: true)
  String name;

  @JsonKey(required: true)
  String phone;

  @JsonKey(required: true)
  int autorized;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  Map<String, dynamic> toJson() => _$GuestToJson(this);
}
