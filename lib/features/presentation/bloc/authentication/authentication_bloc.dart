

import '../../../../sources.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{
  AuthenticationBloc() : super(InitialAuthenticationState()){
    on<LoginAuthenticationEvent>(_login);
    on<RegistrationAuthenticationEvent>(_registration);
    on<ResetPasswordAuthenticationEvent>(_resetPassword);
    on<UserLoggedAuthenticationEvent>(_userLogged);
  }

  void _userLogged(UserLoggedAuthenticationEvent event,emit) async{
    getIt<SharedPreferences>().getString("email") == null ? emit(UnAuthenticatedAuthenticationState()) : emit(AuthenticatedAuthenticationState());
  }

  final _repository = getIt<AuthenticationRepository>();

  void _login(LoginAuthenticationEvent event,emit) async{
    emit(LoadingAuthenticationState());
    final response = await _repository.login(event.model);
    if(response == null){
      emit(AuthenticatedAuthenticationState());
    }else{
      emit(ErrorAuthenticationState(message: response));
    }
  }

  void _registration(RegistrationAuthenticationEvent event,emit) async{
    emit(LoadingAuthenticationState());
    final response = await _repository.registration(event.model);
    if(response == null){
      emit(AuthenticatedAuthenticationState());
    }else{
      emit(ErrorAuthenticationState(message: response));
    }
  }

  void _resetPassword(ResetPasswordAuthenticationEvent event,emit) async{
    _repository.resetPassword(event.email);
  }
}