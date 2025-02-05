
import 'sources.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthenticationBloc>()),
        BlocProvider(create: (context) => getIt<UserManagementBloc>()),
        BlocProvider(create: (context) => getIt<ScreenControllerCubit>()),
        BlocProvider(create: (context) => getIt<TeachersControllerBloc>()),
        BlocProvider(create: (context) => getIt<CommentControllerBloc>()),
        BlocProvider(create: (context)=> getIt<SearchControllerCubit>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
      ),
    );
  }
}
