import 'package:geolocator/geolocator.dart';

class LocationPermissionService {
  Future<bool> tryGetPermission() async {
    bool locationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    return locationServiceEnabled
      ? _tryGetPermission()
      : false;
  }

  Future<bool> hasPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    return _hasPermission(permission);
  }

  Future<bool> _tryGetPermission() async {
    bool isLocationAllowed;
    
    bool isLocationAvailable = await hasPermission();

    if (isLocationAvailable)
    {
      isLocationAllowed = true;
    } else {
      LocationPermission permission = await Geolocator.requestPermission();

      isLocationAllowed = _hasPermission(permission);
    }

    return isLocationAllowed;
  }

  bool _hasPermission(LocationPermission permission) {
    return switch (permission) {
      LocationPermission.always || LocationPermission.whileInUse => true,
      _ => false
    };
  }
}