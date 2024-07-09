// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      Name.fromJson(json['name'] as Map<String, dynamic>),
      birthday: json['dob'] == null
          ? null
          : Birthday.fromJson(json['dob'] as Map<String, dynamic>),
      picture: json['picture'] == null
          ? const ProfilePicture.undefined()
          : ProfilePicture.fromJson(json['picture'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      email: json['email'] as String?,
      phoneNumber: json['cell'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'picture': instance.picture,
      'dob': instance.birthday,
      'location': instance.location,
      'email': instance.email,
      'cell': instance.phoneNumber,
    };
