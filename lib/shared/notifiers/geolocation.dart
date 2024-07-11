import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../permissions/location/location_permission_service.dart';

class Geolocation extends ChangeNotifier {
  LocationPermissionService _locationPermissionService = LocationPermissionService();
  Position? current;

  Geolocation() {
    _initializeCurrentLocation();
  }

  void refreshCurrentLocation() async {
    if (await _locationPermissionService.hasPermission()) {
      current = await Geolocator.getCurrentPosition();

      notifyListeners();
    }
  }

  void _initializeCurrentLocation() async {
    if (await _locationPermissionService.tryGetPermission()) {
      current = await Geolocator.getCurrentPosition();

      notifyListeners();
    }
  }
}