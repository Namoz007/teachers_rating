


import '../../sources.dart';

final getIt = GetIt.instance;

Future<void> setUp() async{
  final pref = await SharedPreferences.getInstance();
  getIt.registerSingleton(pref);
  getIt.registerSingleton(DioFile.getInstance());
  getIt.registerSingleton(AuthenticationDataSource());
  getIt.registerSingleton(AuthenticationRepository());
  getIt.registerSingleton(AuthenticationBloc());
  getIt.registerSingleton(UserManagementDataSource());
  getIt.registerSingleton(UserManagementRepository());
  getIt.registerSingleton(UserManagementBloc());
  getIt.registerSingleton(ScreenControllerCubit());
  getIt.registerSingleton(TeachersDataSource());
  getIt.registerSingleton(TeachersRepository());
  getIt.registerSingleton(TeachersControllerBloc());
  getIt.registerSingleton(CommentControllerDataSource());
  getIt.registerSingleton(CommentControllerRepository());
  getIt.registerSingleton(CommentControllerBloc());
  getIt.registerSingleton(SearchControllerCubit());
}