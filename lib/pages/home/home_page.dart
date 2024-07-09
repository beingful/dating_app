import 'package:flutter/material.dart';
import 'local_dependencies.dart';

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
