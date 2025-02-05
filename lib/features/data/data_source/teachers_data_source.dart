import '../../../sources.dart';

class TeachersDataSource {
  final _dio = getIt<DioFile>().dio;

  Future<List<TeacherModel>> getAllTeacher() async {
    List<String> ratingUsers = [];
    List<TeacherModel> teachers = [];
    final response = await _dio.get('/users.json');
    final data = response.data as Map<String, dynamic>;
    final ratings = await _dio.get("/ratings.json");
    if(ratings.data != null){
      ratingUsers = (ratings.data as Map<String,dynamic>).keys.toList();
    }
    for (int i = 0; i < data.keys.toList().length; i++){
      if (data[data.keys.toList()[i]]['role'] == 'teacher' && data[data.keys.toList()[i]]['subject'] != null && data[data.keys.toList()[i]]['universityName'] != null){
        if(!ratingUsers.contains(data[data.keys.toList()[i]]['id'])) {
          teachers.add(TeacherModel.fromJson(data[data.keys.toList()[i]], false,0,0));
        }else{
          List<RatingEntities> ratingModels = [];
          for(int i = 0;i < ratingUsers.length;i++){
            for(int j = 0;j < ratings.data[ratingUsers[i]].keys.toList().length;j++){
              ratingModels.add(RatingModel.fromJson(ratings.data[ratingUsers[i]][ratings.data[ratingUsers[i]].keys.toList()[j]]));
            }
          }
          double count = 0;
          for(var value in ratingModels) count += value.rating;
          teachers.add(TeacherModel.fromJson(data[data.keys.toList()[i]], ratingModels.indexWhere((value) => value.userId == UserDetails.userModel.id) != -1, count / ratingModels.length,ratingModels.indexWhere((value) => value.userId == UserDetails.userModel.id) != -1 ? ratingModels[ratingModels.indexWhere((value) => value.userId == UserDetails.userModel.id)].rating : null));
        }
      }
    }
    return teachers;
  }

  Future<String?> rateToTeacher(RatingEntities model) async {
    try {
      final response = await _dio.post(
        "/ratings/${model.teacherId}.json",
        data: model.toJson(),
      );
      await _dio.patch("/ratings/${model.teacherId}/${response.data['name']}.json",data: {"id": response.data['name']},);
    } on DioException catch (e) {
      return "Please check your internet connection!";
    } catch (e) {
      return "Something went wrong!";
    }
  }
}
