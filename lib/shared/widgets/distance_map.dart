import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:location_finder/location_finder.dart';
import '../notifiers/geolocation.dart';
import '../notifiers/suggestion.dart';

class DistanceMap extends StatelessWidget {
  final double _maxWidth;
  final double _maxHeight;
  final EdgeInsets _padding;

  DistanceMap(this._maxWidth, this._maxHeight, this._padding);

  @override
  Widget build(BuildContext context) {
    final Suggestion suggestion = Provider.of<Suggestion>(context, listen: false);
    final Geolocation geolocation = Provider.of<Geolocation>(context, listen: false);
    
    final TextStyle textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
      color: Theme.of(context).colorScheme.onPrimaryContainer
    );

    return Padding(
      padding: _padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: _maxWidth,
              maxHeight: _maxHeight,
            ),
            child: GeoMap(
              [
                Position(
                  latitude: geolocation.current!.latitude,
                  longitude: geolocation.current!.longitude,
                  title: 'Domestic'
                ),
                Position(
                  latitude: suggestion.current.location!.point.latitude,
                  longitude: suggestion.current.location!.point.longitude,
                  title: suggestion.current.name.first
                )
              ]
            )
          ),
          Text(
            '${geolocation.kmDistanceTo(suggestion.current.location!.point)}' +
            ' KM away from you',
            style: textStyle,
          )
        ],
      )
    );
  }
}