// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<dynamic, dynamic> json) => Location(
      json['city'] as String,
      json['country'] as String,
      Point.fromJson(json['coordinates'] as Map<dynamic, dynamic>),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'coordinates': instance.point.toJson(),
    };
