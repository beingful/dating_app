import 'package:flutter/material.dart';
import '../../../enums/home_navigation_destination.dart';
import '../../../pages/favorites/favorites_page.dart';
import '../../../pages/people/people_page.dart';
import '../../../profile/providers/interfaces/widget_provider.dart';

class HomePageProvider implements WidgetProvider<HomePageDestination, Widget> {
  @override
  Widget provide(HomePageDestination key) {
    return switch(key) {
      HomePageDestination.people => PeoplePage(),
      HomePageDestination.favorite => FavoritesPage()
    };
  }
}