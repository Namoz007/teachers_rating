import '../../../sources.dart';

class AuthenticationDataSource {
  final _dio = Dio();

  Future<String?> login(LoginEntities model) async {
    try {
      await _dio.post(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAh9N6yt6tdaVM0hx9_IlT4F0yaKZ5Xun8",
        data: model.toJson(),
      );
      getIt<SharedPreferences>().setString("email", model.email);
      return null;
    } catch (e) {
      return "Email or password not correct!";
    }
  }

  Future<String?> registration(RegistrationEntities model) async {
    try {
      await _dio.post(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAh9N6yt6tdaVM0hx9_IlT4F0yaKZ5Xun8",
        data: model.toJson(),
      );
      final response = await _dio.post(
        "https://teacher-rating-530c4-default-rtdb.firebaseio.com/users.json",
        data: {
          "id": " ",
          "email": model.email,
          "fullName": model.fullName,
          "role": model.role.name.toLowerCase(),
        },
      );
      await _dio.patch(
        "https://teacher-rating-530c4-default-rtdb.firebaseio.com/users/${response.data['name']}.json",
        data: {
          "id": response.data['name'],
        },
      );
      getIt<SharedPreferences>().setString("email", model.email);
      return null;
    } catch (e) {
      print("bu xato $e");
      return "User already exists!";
    }
  }

  void resetPassword(String email) {
    //
  }
}
