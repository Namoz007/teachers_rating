abstract class LoginEntities {
  String email;
  String password;

  LoginEntities({
    required this.email,
    required this.password,
  });

  Map<String,dynamic> toJson();
}
