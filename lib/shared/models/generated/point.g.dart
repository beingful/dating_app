// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Point _$PointFromJson(Map<dynamic, dynamic> json) => Point(
      double.parse(json['latitude'].toString()),
      double.parse(json['longitude'].toString()),
    );

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'latitude': '${instance.latitude}',
      'longitude': '${instance.longitude}',
    };
