import 'package:location_finder/location_finder.dart';
import 'package:dating_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dating_app/main.dart';
import 'package:dating_app/shared/notifiers/packs/notifiers.dart';
import 'package:dating_app/shared/providers/user/packs/user_providers.dart';

class MockDatingApp extends DatingApp {
  MockDatingApp(super.repository);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Suggestion(
            RandomUserProvider([AnonymousUserProvider()])
          )
        ),
        ChangeNotifierProvider(
          create: (_) => Favorites(super.repository)
        ),
        ChangeNotifierProvider(
          create: (_) => Geolocation()
        ),
        ChangeNotifierProvider(
          create: (_) => GeoMapStyle()
        )
      ],
      child: MaterialApp(
        title: 'Dating App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 241, 156, 230),
            primary: Color.fromARGB(255, 241, 156, 230),
            secondary: Color.fromARGB(255, 99, 81, 97))
        ),
        home: HomePage(repository),
      ),
    );
  }
}