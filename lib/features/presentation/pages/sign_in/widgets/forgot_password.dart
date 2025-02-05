import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers/features/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:teachers/features/presentation/bloc/authentication/authentication_event.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Forgot password"),
      content: Form(
        key: _formKey,
        child: TextFormField(
          validator: (value){
            if(value == null || value.isEmpty){
              return "Please check your email address!";
            }

            if(!value.contains('@')){
              return "E-mail format not correct!";
            }
            return null;
          },
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: "E-mail"
          ),
        ),
      ),
      actions: [
        ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
        ElevatedButton(onPressed: (){
          if(_formKey.currentState!.validate()){
            context.read<AuthenticationBloc>().add(ResetPasswordAuthenticationEvent(email: _controller.text));
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Link send your email")));
          }
        }, child: Text("Send sms")),
      ],
    );
  }
}
