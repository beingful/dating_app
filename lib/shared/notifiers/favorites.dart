import 'dart:async';
import 'package:dating_app/database/converters/user_converter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../../database/repositories/repository.dart';

class Favorites extends ChangeNotifier {
  final Repository<User> _repository;
  late StreamSubscription<DatabaseEvent> subscription;
  List<User> users = [];

  Favorites(this._repository) {
    _init();
  }

  bool get isNotEmpty => users.isNotEmpty;

  void removeUser(User user) async {
    await _repository.remove(user.id);
  }

  void addUser(User user) async {
    await _repository.set(user, UserConverter());
  }

  @override
  void dispose() {
    subscription.cancel();

    super.dispose();
  }

  void _init() async {
    subscription = _repository.listen(_refreshFavorites);

    users = await _repository.getAll(UserConverter());

    notifyListeners();
  }

  void _refreshFavorites(Map<dynamic, dynamic> data) {
    users.clear();

    UserConverter converter = UserConverter();

    data.forEach((key, value) {
      users.add(converter.fromJson(value));
    });

    notifyListeners();
  }
}