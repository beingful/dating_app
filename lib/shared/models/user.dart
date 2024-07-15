import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'packs/user_info.dart';
import 'profile.dart';
import '../../database/models/document.dart';

part 'generated/user.g.dart';

@JsonSerializable()
class User extends Document with Profile {
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

  User(super.id, this.name, {this.birthday, this.picture = const ProfilePicture.undefined(), this.location, this.email, this.phoneNumber});

  User.undefined() : this(Uuid().v4(), Name('-', '-'));
  User.anonymous(Name name, Birthday birthday, String email)
    : this(Uuid().v4(), name, birthday: birthday, picture: ProfilePicture.undefined(), email: email);

  factory User.fromJson(Map<dynamic, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool operator ==(Object other) {
    return id == (other as User).id;
  }

  @override
  String get description =>
    '$name' +
    (birthday == null ? '' : '\n$birthday') +
    (location == null ? '' : '\n$location') +
    (email == null ? '' : '\nE-mail: $email') +
    (phoneNumber == null ? '' : '\nPhone number: $phoneNumber');
}