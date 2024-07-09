import 'package:flutter/material.dart';
import '../models/user.dart';

class Favorites extends ChangeNotifier {
  final List<User> users = [];

  bool get isNotEmpty {
    return users.isNotEmpty;
  }

  void toggle(User user) {
    if (users.contains(user)) {
      removeUser(user);
      addUser(user);
    } else {
      addUser(user);
    }

    notifyListeners();
  }

  void removeUser(User user) {
    users.remove(user);

    notifyListeners();
  }

  void addUser(User user) {
    users.add(user);

    notifyListeners();
  }
}