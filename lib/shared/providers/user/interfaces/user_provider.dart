import '../../../models/user.dart';

abstract interface class UserProvider {
  Future<User> provideAsync();
}