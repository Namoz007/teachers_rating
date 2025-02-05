abstract class TeacherEntities {
  String id;
  String fullName;
  String subject;
  String universityName;
  String? avatar;
  bool isRated;
  double rating;
  double? myRate;

  TeacherEntities({
    required this.id,
    required this.fullName,
    required this.subject,
    required this.universityName,
    this.avatar,
    required this.isRated,
    required this.rating,
    this.myRate,
  });

}
