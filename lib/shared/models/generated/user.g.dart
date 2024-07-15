// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<dynamic, dynamic> json) => User(
      json['id'] is String ? json['id'] as String : Uuid().v4(),
      Name.fromJson(json['name'] as Map<dynamic, dynamic>),
      birthday: json['dob'] == null
          ? null
          : Birthday.fromJson(json['dob'] as Map<dynamic, dynamic>),
      picture: json['picture'] == null
          ? const ProfilePicture.undefined()
          : ProfilePicture.fromJson(json['picture'] as Map<dynamic, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<dynamic, dynamic>),
      email: json['email'] as String?,
      phoneNumber: json['cell'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id' : instance.id,
      'name': instance.name.toJson(),
      'picture': instance.picture.toJson(),
      if (instance.birthday != null) 'dob': instance.birthday!.toJson(),
      if (instance.location != null) 'location': instance.location!.toJson(),
      'email': instance.email,
      'cell': instance.phoneNumber,
    };
