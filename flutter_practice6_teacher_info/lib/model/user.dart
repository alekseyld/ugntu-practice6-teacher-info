import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

enum UserRole { ADMIN, TEACHER }

@JsonSerializable()
class User {
  final String name;
  final UserRole userRole;

  User({
    required this.name,
    required this.userRole,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
