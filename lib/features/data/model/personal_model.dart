
import '../../../sources.dart';

class PersonalModel extends PersonalEntities {
  PersonalModel({
    required super.id,
    required super.email,
    required super.fullName,
    required super.role,
    super.avatar,
    super.subject,
    super.universityName,
    super.birthday,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email":email,
      "fullName": fullName,
      "role": role.name,
      "avatar": avatar,
      "subject": subject,
      "universityName": universityName,
      "birthday": birthday == null ? null : birthday.toString(),
    };
  }

  factory PersonalModel.fromJson(Map<String,dynamic> json){
    return PersonalModel(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      role: getRoleWithRoleName(json['role']),
      avatar: json['avatar'],
      subject: json['subject'],
      universityName: json['universityName'],
      birthday: json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
    );
  }
}
