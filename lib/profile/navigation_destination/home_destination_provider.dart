 import 'package:flutter/material.dart';
 import '../../pages/home/navigation/enums/home_navigation_destination.dart';
 
 class HomeDestinationProvider {
  final ColorScheme _colorScheme;

  HomeDestinationProvider(this._colorScheme);

  NavigationRailDestination provide(HomePageDestination key) {
    return switch (key) {
      HomePageDestination.people => NavigationRailDestination(
        icon: Icon(
          Icons.account_box,
          color: _colorScheme.primary
        ),
        label: Text('People')
      ),
      HomePageDestination.favorite => NavigationRailDestination(
        icon: Icon(
          Icons.favorite,
          color: _colorScheme.primary
        ),
        label: Text('Favorite'),
      )
    };
  }
 }