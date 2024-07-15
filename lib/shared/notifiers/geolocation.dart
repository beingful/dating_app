import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/point.dart';
import '../../permissions/location/location_permission_service.dart';

class Geolocation extends ChangeNotifier {
  LocationPermissionService _locationPermissionService = LocationPermissionService();
  Point? current;

  Geolocation() {
    _initializeCurrentLocation();
  }

  int? kmDistanceTo(Point geopoint) {
    return current == null
    ? null
    :  (Geolocator.distanceBetween(
        current!.latitude,
        current!.longitude,
        geopoint.latitude,
        geopoint.longitude
      ) / 1000).round();
  }

  void refreshCurrentLocation() async {
    if (await _locationPermissionService.hasPermission()) {
      await _changeCurrentLocation();
    }
  }

  void _initializeCurrentLocation() async {
    if (await _locationPermissionService.tryGetPermission()) {
      await _changeCurrentLocation();
    }
  }

  Future<void> _changeCurrentLocation() async {
    Position currentPosition = await Geolocator.getCurrentPosition();

    current = Point(
      currentPosition.latitude,
      currentPosition.longitude
    );

    notifyListeners();
  }
}