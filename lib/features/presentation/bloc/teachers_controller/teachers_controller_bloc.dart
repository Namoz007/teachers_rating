
import '../../../../sources.dart';

class TeachersControllerBloc extends Bloc<TeachersControllerEvent,TeachersControllerState>{
  TeachersControllerBloc() : super(InitialTeachersControllerState()){
    on<GetAllTeachersControllerEvent>(_getAllTeachers);
    on<RateToTeachersControllerEvent>(_rateToTeacher);
  }

  final _repository = getIt<TeachersRepository>();

  void _rateToTeacher(RateToTeachersControllerEvent event,emit) async{
    final response = await _repository.rateToTeacher(event.model);
    if(response == null){
      add(GetAllTeachersControllerEvent());
    }else{
      emit(ErrorCommentControllerState(message: response));
      add(GetAllTeachersControllerEvent());
    }
  }

  void _getAllTeachers(GetAllTeachersControllerEvent event,emit) async{
    emit(LoadingTeachersControllerState());
    try{
      emit(LoadedTeachersControllerState(teachers: await _repository.getAllTeachers()));
    }catch(e){
      print("teacherlar olib kelishda xato $e");
      emit(ErrorTeachersControllerState(message: "Please try again later!"));
      emit(InitialTeachersControllerState());
    }
  }
}