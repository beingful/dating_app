import '../../shared/models/user.dart';
import '../interfaces/converter.dart';

class UserConverter extends Converter<User> {
  @override
  User fromJson(Map<dynamic, dynamic> json) {
    return User.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(User model) {
    return model.toJson();
  }
}