
import '../../../sources.dart';

class UserManagementDataSource{
  final _dio = getIt<DioFile>().dio;

  Future<String?> getUser() async{
    try{
      final response = await _dio.get("/users.json");
      final data = response.data as Map<String,dynamic>;
      for(int i = 0;i < data.keys.toList().length;i++){
        if(data[data.keys.toList()[i]]['email'] == getIt<SharedPreferences>().getString("email")){
          UserDetails.userModel = PersonalModel.fromJson(data[data.keys.toList()[i]]);
          return null;
        }
      }
    }on DioException catch(e){
      return "Please check your internet connection!";
    }catch(e){
      return "Something went wrong!";
    }
  }

  Future<String?> updateUser(PersonalEntities model) async{
    try{
      await _dio.patch("/users/${UserDetails.userModel.id}.json",data: model.toJson(),);
    }on DioException catch(e){
      print("user updateda dio xatosi $e");
      return "Please check your internet connection!";
    }catch(e){
      print("user updateda oddiy xato $e");
      return "Something went wrong!";
    }
  }
}