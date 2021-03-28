import 'package:demo_user/modules/user/domain/models/geo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  @JsonKey(name: "street")
  String street;

  @JsonKey(name: "suite")
  String suite;

  @JsonKey(name: "city")
  String city;

  @JsonKey(name: "zipCode")
  String zipCode;

  @JsonKey(name: "geo")
  Geo geo;

  Address({this.street, this.suite, this.city, this.zipCode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  factory Address.fromJsonString(String jsonString) => Address.fromJson(json.decode(jsonString) as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  String toJsonString() => json.encode(toJson());
}
