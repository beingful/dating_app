import 'package:flutter/material.dart';
import 'package:dating_app/pages/people/suggestion.dart';
import 'package:dating_app/profile/providers/user/user_providers.dart';
import 'package:provider/provider.dart';
import 'pages/favorites/favorites.dart';
import 'pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Suggestion(
            RandomUserProvider([NormalUserProvider(), EmptyUserProvider()])
          )
        ),
        ChangeNotifierProvider(
          create: (_) => Favorites()
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
        home: HomePage(),
      ),
    );
  }
}