abstract class UserEntities {
  String id;
  String fullName;
  String? avatar;
  String email;

  UserEntities({
    required this.id,
    required this.fullName,
    this.avatar,
    required this.email,
  });


}
