import 'package:flutter/material.dart';
import 'package:dating_app/profile/providers/page/home_page_provider.dart';
import '../../enums/home_navigation_destination.dart';
import '../../profile/providers/interfaces/widget_provider.dart';
import '../../profile/providers/navigation_destination/home_destination_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState(HomePageProvider());
}

class _HomePageState extends State<HomePage> {
  final WidgetProvider<Enum, Widget> _homePageProvider;
  HomePageDestination currentDestination = HomePageDestination.values[0];

  _HomePageState(this._homePageProvider);

  @override
  Widget build(BuildContext context) {
    final ThemeData mainTheme = Theme.of(context);
    final HomeDestinationProvider destinationProvider = HomeDestinationProvider(mainTheme.colorScheme);

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              destinations: HomePageDestination.values.expand((destinationId) => {
                destinationProvider.provide(destinationId)
              }).toList(),
              selectedIndex: currentDestination.index,
              onDestinationSelected: (newIndex) => {
                setState(() {
                  currentDestination = HomePageDestination.values[newIndex];
                })
              },
            ),
          ),
          Expanded(
            child: Container(
              color: mainTheme.colorScheme.primaryContainer,
              child: _homePageProvider.provide(currentDestination),
            ),
          ),
        ],
      ),
    );
  }
}
