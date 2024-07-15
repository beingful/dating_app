import 'package:json_annotation/json_annotation.dart';

part 'generated/point.g.dart';

@JsonSerializable()
class Point {
  final double latitude;
  final double longitude;

  Point(this.latitude, this.longitude);

  factory Point.fromJson(Map<dynamic, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);
}