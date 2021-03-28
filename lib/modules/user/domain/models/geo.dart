import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'geo.g.dart';

@JsonSerializable(explicitToJson: true)
class Geo {
  @JsonKey(name: "lat")
  String lat;
  @JsonKey(name: "lng")
  String lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  factory Geo.fromJsonString(String jsonString) => Geo.fromJson(json.decode(jsonString) as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$GeoToJson(this);

  String toJsonString() => json.encode(toJson());
}

