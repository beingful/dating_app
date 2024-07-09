import 'package:flutter/material.dart';
import '../enums/home_navigation_destination.dart';
import '../../../packs/pages.dart';
import '../../../../shared/providers/widget/interfaces/widget_provider.dart';

class HomePageProvider implements WidgetProvider<HomePageDestination, Widget> {
  @override
  Widget provide(HomePageDestination key) {
    return switch(key) {
      HomePageDestination.people => PeoplePage(),
      HomePageDestination.favorite => FavoritesPage()
    };
  }
}