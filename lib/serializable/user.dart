import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserData {
  UserData(this.data);

  @JsonKey(required: true)
  User data;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class User {
  User(this.id, this.name, this.phone, this.sendedSms, this.username);

  @JsonKey(required: true)
  int id;

  @JsonKey(required: true)
  String username;

  @JsonKey(required: true)
  String name;

  @JsonKey(required: true)
  String phone;

  @JsonKey(required: true, name: 'sended_sms')
  bool sendedSms;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
