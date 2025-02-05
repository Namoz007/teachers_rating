import '../../../sources.dart';

class TeacherModel extends TeacherEntities {
  TeacherModel({
    required super.id,
    required super.fullName,
    required super.subject,
    required super.universityName,
    super.avatar,
    required super.isRated,
    required super.rating,
    super.myRate,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json,bool isRate,double rate,double? myRated) {
    return TeacherModel(
      id: json['id'],
      fullName: json['fullName'],
      subject: json['subject'],
      universityName: json['universityName'],
      avatar: json['avatar'],
      isRated: isRate,
      rating: rate,
      myRate: myRated,
    );
  }
}
