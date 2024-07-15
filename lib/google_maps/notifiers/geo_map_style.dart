import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../styles/map/map_style.dart';

class GeoMapStyle extends ChangeNotifier {
  final Map<MapStyle, String> _mapStyles = {};
  MapStyle _currentStyle = MapStyle.values[0];

  GeoMapStyle() {
    _initializeStyles();
  }

  String? get current {
    return _mapStyles.isNotEmpty
    ? _mapStyles[_currentStyle]
    : null;
  }

  void getNext() {
    _currentStyle = MapStyle.values[(_currentStyle.index + 1) % MapStyle.values.length];

    notifyListeners();
  }

  void _initializeStyles() async {
    for(MapStyle style in MapStyle.values) {
      String styleContent = await rootBundle.loadString(style.filePath);
      _mapStyles[style] = styleContent;
    }

    notifyListeners();
  }
}