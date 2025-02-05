import 'package:teachers/features/domain/entities/entities.dart';

class LoginRequestModel extends LoginEntities {
  LoginRequestModel({
    required super.email,
    required super.password,
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
