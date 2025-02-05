
import '../../../sources.dart';

class UserManagementRepository{
  final _dataSource = getIt<UserManagementDataSource>();

  Future<String?> getUser() async{
    return await _dataSource.getUser();
  }

  Future<String?> updateUser(PersonalEntities model) async{
    return await _dataSource.updateUser(model);
  }
}