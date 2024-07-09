import 'profile_picture.dart';

abstract mixin class Profile {
  final ProfilePicture picture = ProfilePicture.undefined();

  String get description;
}