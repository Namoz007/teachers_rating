
import '../../../sources.dart';

abstract class RegistrationEntities {
  String fullName;
  String email;
  String password;
  user_role role;

  RegistrationEntities({
    required this.fullName,
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String,dynamic> toJson();
}
