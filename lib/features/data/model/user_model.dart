import 'package:teachers/features/domain/entities/entities.dart';

class UserModel extends UserEntities {
  UserModel({
    required super.id,
    required super.fullName,
    super.avatar,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
    );
  }
}
