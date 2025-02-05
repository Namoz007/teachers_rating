
import '../../../../sources.dart';

class SearchControllerCubit extends Cubit<SearchControllerState>{
  SearchControllerCubit() : super(SearchControllerState(teachers: []));
  List<TeacherEntities> teachers= [];

  void searchTeacherByName(String name){
    emit(SearchControllerState(teachers: [for(var value in teachers) if(value.fullName.toLowerCase().contains(name.toLowerCase()) || value.subject.toLowerCase().contains(name.toLowerCase())) value]));
  }

  void loadedTeachers(List<TeacherEntities> teacherModels){
    teachers = teacherModels;
  }
}