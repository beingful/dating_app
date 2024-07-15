import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../notifiers/geo_map_style.dart';
import '../models/packs/models.dart';

class GeoMap extends StatelessWidget {
  final List<Position> _positions;
  GoogleMapController? mapController;

  GeoMap(this._positions);

  @override
  Widget build(BuildContext context) {
    final GeoMapStyle styles = Provider.of<GeoMapStyle>(context);
    final Position center = _positions.reduce((x, y) => x.halfway(y));

    return GoogleMap(
      key: ValueKey('${center.latitude} ${center.longitude}'),
      initialCameraPosition: CameraPosition(
        target: LatLng(center.latitude, center.longitude),
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      mapType: MapType.normal,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      mapToolbarEnabled: false,
      style: styles.current,
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
        _moveCamera();
      },
      onTap: (_) => styles.getNext(),
      markers: _positions.map((point) => Marker(
        markerId: MarkerId(point.title),
        position: LatLng(point.latitude, point.longitude),
      )).toSet()
    );
  }

  void _moveCamera() {
    Boundary boundary = Boundary(_positions);

    mapController!.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(
            boundary.southwest.latitude,
            boundary.southwest.longitude
          ),
          northeast: LatLng(
            boundary.northeast.latitude,
            boundary.northeast.longitude
          )
        ),
        20
      )
    );
  }
}