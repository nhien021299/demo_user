import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'company.g.dart';

@JsonSerializable(explicitToJson: true)
class Company {
  @JsonKey(name: "companyName")
  String companyName;

  @JsonKey(name: "catchPhrase")
  String catchPhrase;

  @JsonKey(name: "bs")
  String bs;

  Company({this.companyName, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  factory Company.fromJsonString(String jsonString) => Company.fromJson(json.decode(jsonString) as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  String toJsonString() => json.encode(toJson());
}
