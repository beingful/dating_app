import 'dart:async';
import 'dart:math';
import 'interfaces/user_provider.dart';
import '../../shared/models/user.dart';

class RandomUserProvider implements UserProvider {
  final List<UserProvider> _providers;

  RandomUserProvider(this._providers);

  @override
  Future<User> provideAsync() async {
    int seed = _providers.length * 5;
    double ratio = _providers.length / (seed * 1.5);
    int randomNumber = Random().nextInt(seed);

    return await _providers[(randomNumber * ratio).floor()].provideAsync();
  }
}