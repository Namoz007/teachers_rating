import 'package:flutter/cupertino.dart';

import '../../../../../sources.dart';

class RegistrationButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController roleController;
  RegistrationButton({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.roleController,
  });

  @override
  State<RegistrationButton> createState() => _RegistrationButtonState();
}

class _RegistrationButtonState extends State<RegistrationButton> {
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
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(
              title: "Registration failed!",
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
            showDialog(context: context, builder: (context) => LoadingDialog());
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
          buttonText: "Sign Up",
          tapFunction: () {
            if (widget.formKey.currentState!.validate()) {
              context.read<AuthenticationBloc>().add(
                    RegistrationAuthenticationEvent(
                      model: RegistrationRequestModel(
                          fullName: widget.fullNameController.text,
                          email: widget.emailController.text,
                          password: widget.passwordController.text,
                          role:
                              getRoleWithRoleName(widget.roleController.text)),
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
