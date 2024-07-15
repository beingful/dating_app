import 'package:flutter_map_math/flutter_geo_math.dart';
import 'package:latlong2/latlong.dart';

class Position {
  final double latitude;
  final double longitude;
  final String title;

  Position({
    required this.latitude,
    required this.longitude,
    required this.title});

  Position halfway(Position destination) {
    LatLng midpoint = FlutterMapMath().midpointBetween(
      LatLng(latitude, longitude),
      LatLng(destination.latitude, destination.longitude)
    );

    return Position(
      latitude: midpoint.latitude,
      longitude: midpoint.longitude,
      title: '$halfway'
    );
  }
}