
import '../../../sources.dart';

class AuthenticationRepository{
  final _dataSources = getIt<AuthenticationDataSource>();

  Future<String?> login(LoginEntities model) async{
    return await _dataSources.login(model);
  }

  Future<String?> registration(RegistrationEntities model) async{
    return await _dataSources.registration(model);
  }

  void resetPassword(String email) {
    _dataSources.resetPassword(email);
  }
}