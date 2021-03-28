import 'package:demo_user/modules/user/domain/models/address.dart';
import 'package:demo_user/modules/user/domain/models/company.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "username")
  String username;

  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "address")
  Address address;

  @JsonKey(name: "phone")
  String phone;

  @JsonKey(name: "website")
  String website;

  @JsonKey(name: "company")
  Company company;

  User(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromJsonString(String jsonString) => User.fromJson(json.decode(jsonString) as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String toJsonString() => json.encode(toJson());
}
