
import '../../../sources.dart';

class TeachersRepository{
  final _dataSource = getIt<TeachersDataSource>();

  Future<List<TeacherModel>> getAllTeachers() async{
    return await _dataSource.getAllTeacher();
  }

  Future<String?> rateToTeacher(RatingEntities model) async{
    return await _dataSource.rateToTeacher(model);
  }
}