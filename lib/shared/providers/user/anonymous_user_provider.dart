import 'dart:async';
import 'dart:math';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:english_words/english_words.dart';
import 'interfaces/user_provider.dart';
import '../../models/packs/user_info.dart';

class AnonymousUserProvider implements UserProvider {
  @override
  Future<User> provideAsync() {
    RandomNames sourceOfName = RandomNames();

    Name name = Name(sourceOfName.name(), sourceOfName.surname());
    Birthday birthday = Birthday.ageOnly(age: Random().nextInt(80) + 20);
    String email = '${WordPair.random().asSnakeCase}@gmail.com';
    Completer<User> completer = Completer<User>();

    User user = User.anonymous(name, birthday, email);

    completer.complete(user);

    return completer.future;
  }
}