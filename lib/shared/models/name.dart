import 'package:json_annotation/json_annotation.dart';

part 'generated/name.g.dart';

@JsonSerializable()
class Name {
  final String first;
  final String last;

  Name(this.first, this.last);

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);

  @override
  String toString() {
   return '$Name: $first $last';
  }
}

