import 'package:json_annotation/json_annotation.dart';
import 'point.dart';

part 'generated/location.g.dart';

@JsonSerializable()
class Location {
  final String city;
  final String country;

  @JsonKey(name: 'coordinates')
  final Point point;

  Location(this.city, this.country, this.point);

  factory Location.fromJson(Map<dynamic, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  String toString() {
   return 'Location: $city, $country';
  }
}