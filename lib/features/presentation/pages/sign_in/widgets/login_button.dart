import 'package:flutter/cupertino.dart';

import '../../../../../sources.dart';

class LoginButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LoadingAuthenticationState) {
          showDialog(
            context: context,
            builder: (context) => LoadingDialog(),
            barrierDismissible: false,
          );
        }

        if (state is ErrorAuthenticationState) {
          Navigator.pop(context);
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => ErrorDialog(
              title: "Login failed!",
              subtitle: state.message,
            ),
          );
        }

        if (state is AuthenticatedAuthenticationState) {
          Navigator.pop(context);
          context.read<UserManagementBloc>().add(GetUserManagementEvent());
        }
      },
      child: BlocListener<UserManagementBloc, UserManagementState>(
        listener: (context, state) {
          if (state is LoadingUserManagementState) {
            showDialog(
              context: context,
              builder: (context) => LoadingDialog(),
              barrierDismissible: false,
            );
          }

          if (state is ErrorUserManagementState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => ErrorDialog(
                  title: "User Management failed!", subtitle: state.message),
            );
          }

          if (state is LoadedUserManagementState) {
            Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(builder: (context) => BaseScreen()),
              (bool) => false,
            );
          }
        },
        child: UniversalButton(
          buttonText: "Sign In",
          tapFunction: () {
            if (widget.formKey.currentState!.validate()) {
              context.read<AuthenticationBloc>().add(
                    LoginAuthenticationEvent(
                      model: LoginRequestModel(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      ),
                    ),
                  );
            }
          },
          buttonColor: Colors.blue,
        ),
      ),
    );
  }
}
