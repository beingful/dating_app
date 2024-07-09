import 'package:json_annotation/json_annotation.dart';

part 'birthday.g.dart';

@JsonSerializable()
class Birthday {
  final DateTime? date;
  final int age;

  Birthday(this.date, this.age);

  Birthday.ageOnly({required int age}) : this(null, age);

  factory Birthday.fromJson(Map<String, dynamic> json) => _$BirthdayFromJson(json);

  Map<String, dynamic> toJson() => _$BirthdayToJson(this);

  @override
  String toString() {
   return date == null ? 'Age: $age' : 'Date of birth: $date, $age';
  }
}