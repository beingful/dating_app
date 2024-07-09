import 'package:flutter/material.dart';
import '../../profile/providers/interfaces/user_provider.dart';
import '../../profile/models/user.dart';

class Suggestion extends ChangeNotifier {
  final UserProvider _userProvider;
  User _currentUser = User.undefined();

  Suggestion(this._userProvider) {
    createNext();
  }

  User get current => _currentUser;

  void createNext() async {
    _currentUser = await _userProvider.provideAsync().then((user) {
      notifyListeners();
      return user;
    });
  }
}