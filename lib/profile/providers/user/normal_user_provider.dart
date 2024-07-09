import 'dart:convert';
import 'package:http/http.dart' as http;
import '../interfaces/user_provider.dart';
import '../../models/user.dart';

class NormalUserProvider implements UserProvider {
  final Uri source = Uri.https('randomuser.me', 'api', {'results': '1'} );

  @override
  Future<User> provideAsync() async {
    http.Response response = await http.get(source);

    Map<String, dynamic> userInfo = jsonDecode(response.body) as Map<String, dynamic>;

    return User.fromJson(userInfo['results'][0]);
  }
}