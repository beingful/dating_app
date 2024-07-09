import 'package:json_annotation/json_annotation.dart';

part 'profile_picture.g.dart';

@JsonSerializable()
class ProfilePicture {
  @JsonKey(name: "large")
  final String url;

  ProfilePicture(this.url);

  const ProfilePicture.undefined() : url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png';

  factory ProfilePicture.fromJson(Map<String, dynamic> json) => _$ProfilePictureFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePictureToJson(this);
}