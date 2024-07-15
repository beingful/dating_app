import 'package:dating_app/database/repositories/repository.dart';
import 'package:flutter/material.dart';
import '../../shared/models/user.dart';
import 'local_dependencies.dart';

class HomePage extends StatefulWidget {
  final Repository<User> repository;
  
  HomePage(this.repository);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageProvider _homePageProvider = HomePageProvider();
  HomePageDestination _currentDestination = HomePageDestination.values[0];

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
              selectedIndex: _currentDestination.index,
              onDestinationSelected: (newIndex) => {
                setState(() {
                  _currentDestination = HomePageDestination.values[newIndex];
                })
              },
            ),
          ),
          Expanded(
            child: Container(
              color: mainTheme.colorScheme.primaryContainer,
              child: _homePageProvider
                .provide(_currentDestination)
                .call(widget.repository),
            ),
          ),
        ],
      ),
    );
  }
}
