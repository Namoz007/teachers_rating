
import '../../../../sources.dart';

class UserManagementBloc extends Bloc<UserManagementEvent,UserManagementState>{
  UserManagementBloc() : super(InitialUserManagementState()){
    on<GetUserManagementEvent>(_getUser);
    on<UpdateUserManagementEvent>(_updateProfile);
  }

  final _repository = getIt<UserManagementRepository>();

  void _updateProfile(UpdateUserManagementEvent event,emit) async{
    emit(LoadingUserManagementState());
    final response = await _repository.updateUser(event.model);
    if(response == null){
      add(GetUserManagementEvent());
    }else{
      emit(ErrorUserManagementState(message: response));
      emit(LoadedUserManagementState(model: UserDetails.userModel));
    }
  }

  void _getUser(GetUserManagementEvent event,emit) async{
    emit(LoadingUserManagementState());
    final response = await _repository.getUser();
    if(response == null){
      emit(LoadedUserManagementState(model: UserDetails.userModel));
    }else{
      emit(ErrorUserManagementState(message: response));
    }
  }
}