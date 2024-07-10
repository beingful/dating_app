import 'package:json_annotation/json_annotation.dart';
import 'profile.dart';
import 'name.dart';
import 'birthday.dart';
import 'location.dart';
import 'profile_picture.dart';

part 'generated/user.g.dart';

@JsonSerializable()
class User with Profile {
  final Name name;
  final Location? location;
  final String? email;

  @override
  final ProfilePicture picture;

  @JsonKey(name: 'dob')
  final Birthday? birthday;

  @JsonKey(name: 'cell')
  final String? phoneNumber;

  @JsonKey(includeFromJson: false)
  bool isLiked = false;

  User(this.name, {this.birthday, this.picture = const ProfilePicture.undefined(), this.location, this.email, this.phoneNumber});

  User.undefined() : this(Name('-', '-'));

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String get description =>
    '$name' +
    (birthday == null ? '' : '\n$birthday') +
    (location == null ? '' : '\n$location') +
    (email == null ? '' : '\nE-mail: $email') +
    (phoneNumber == null ? '' : '\nPhone number: $phoneNumber');
}