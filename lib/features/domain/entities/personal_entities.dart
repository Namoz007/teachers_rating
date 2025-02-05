import 'package:teachers/core/core.dart';

abstract class PersonalEntities {
  String id;
  String email;
  String fullName;
  user_role role;
  String? avatar;
  String? subject;
  String? universityName;
  DateTime? birthday;

  PersonalEntities({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    this.avatar,
    this.subject,
    this.universityName,
    this.birthday,
  });

  Map<String,dynamic> toJson();
}
