import 'package:dating_app/shared/models/user.dart';
import 'package:flutter/material.dart';
import '../enums/home_navigation_destination.dart';
import '../../../packs/pages.dart';
import '../../../../database/repositories/repository.dart';

class HomePageProvider {
  Widget Function(Repository<User>) provide(HomePageDestination key) {
    return switch(key) {
      HomePageDestination.people => (repository) => PeoplePage(repository),
      HomePageDestination.favorite => (_) => FavoritesPage()
    };
  }
}