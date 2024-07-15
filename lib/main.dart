import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:location_finder/location_finder.dart';
import 'database/repositories/repository.dart';
import 'firebase_options.dart';
import 'pages/home/home_page.dart';
import 'shared/models/user.dart';
import 'shared/notifiers/packs/notifiers.dart';
import 'shared/providers/user/packs/user_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Repository<User>(FirebaseDatabase.instance.ref('users'));

  runApp(
    DatingApp(
      Repository<User>(
        FirebaseDatabase.instance.ref('users')
      )
    )
  );
}

class DatingApp extends StatelessWidget {
  final Repository<User> repository;
  
  DatingApp(this.repository);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Suggestion(
            RandomUserProvider([NormalUserProvider(), AnonymousUserProvider()])
          )
        ),
        ChangeNotifierProvider(
          create: (_) => Favorites(repository)
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