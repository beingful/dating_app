import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final String city;
  final String country;

  Location(this.city, this.country);

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  String toString() {
   return '$Location: $city, $country';
  }
}