import 'position.dart';

class Boundary {
  final List<Position> _positions;

  Boundary(this._positions);

  Position get southwest {
    return _positions.reduce((x, y) {
      return Position(
        latitude: x.latitude < y.latitude ? x.latitude : y.latitude,
        longitude: x.longitude < y.longitude ? x.longitude : y.longitude,
        title: 'southwest'
      );
    });
  }

  Position get northeast {
    return _positions.reduce((x, y) {
      return Position(
        latitude: x.latitude > y.latitude ? x.latitude : y.latitude,
        longitude: x.longitude > y.longitude ? x.longitude : y.longitude,
        title: 'northeast'
      );
    });
  }
}