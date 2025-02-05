import 'package:teachers/features/domain/entities/entities.dart';

class RegistrationRequestModel extends RegistrationEntities {
  RegistrationRequestModel({
    required super.fullName,
    required super.email,
    required super.password,
    required super.role,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "returnSecureToken": true,
    };
  }
}
