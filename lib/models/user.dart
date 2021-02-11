import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  int first;
  int second;
  int third;
  User({this.id, this.name, this.first, this.second, this.third});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // _$UserToJsonが生成される
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
