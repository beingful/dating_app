// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../birthday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Birthday _$BirthdayFromJson(Map<String, dynamic> json) => Birthday(
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$BirthdayToJson(Birthday instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'age': instance.age,
    };
