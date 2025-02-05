import 'package:flutter/cupertino.dart';

import '../../../../sources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(UserLoggedAuthenticationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc,AuthenticationState>(
        listener: (context, state) {
          if(state is AuthenticatedAuthenticationState){
            context.read<UserManagementBloc>().add(GetUserManagementEvent());
          }

          if(state is UnAuthenticatedAuthenticationState){
            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => SignInScreen()));
          }

        },
        child: BlocListener<UserManagementBloc,UserManagementState>(
          listener: (context, state) {
            if(state is LoadedUserManagementState){
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => BaseScreen()));
            }

            if(state is ErrorUserManagementState){
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => SignInScreen()));

            }
          },
          child: Center(
            child: Text(
              "Teachers rating!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
