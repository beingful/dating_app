import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import '../interfaces/converter.dart';
import '../models/document.dart';

class Repository<TModel extends Document> {
  final DatabaseReference _database;

  Repository(this._database);

  StreamSubscription<DatabaseEvent> listen(Function(Map<dynamic, dynamic>) onEvent) {

    return _database.onValue.listen((event) {
      if (event.snapshot.value != null) {
        onEvent.call(event.snapshot.value as Map<dynamic, dynamic>);
      }
      else {
        onEvent.call({});
      }
    });
  }

  Future<void> set(TModel model, Converter<TModel> converter) async {
    Map<String, dynamic> json = converter.toJson(model);
      
    await _database.child(model.id).set(json);
  }

  Future<List<TModel>> getAll(Converter<TModel> converter) async {
    List<TModel> models = [];

    DatabaseEvent event = await _database.once(DatabaseEventType.value);
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.exists && snapshot.value != null && snapshot.children.isNotEmpty) {
      Map<dynamic, dynamic> etries = snapshot.value as Map<dynamic, dynamic>;

      etries.forEach((key, value) =>
        models.add(converter.fromJson(value as Map<String, dynamic>)));
    }

    return models;
  }

  Future<void> remove(String userId) async {
    await _database.child(userId).remove();
  }

  Future<void> removeAll() async {
    await _database.remove();
  }
}