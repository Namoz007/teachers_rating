import 'package:flutter/cupertino.dart';

import '../../../../sources.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          children: [
            const SizedBox(
              height: 120,
            ),
            Center(
              child: Text(
                "Teachers rating!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: UniversalField(
                controller: _fullNameController,
                hintText: "Full name",
                fieldIcon: Icons.person,
                isPassword: false,
                isEmail: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: UniversalField(
                controller: _emailController,
                hintText: "E-mail",
                fieldIcon: Icons.email,
                isPassword: false,
                isEmail: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: UniversalField(
                controller: _passwordController,
                hintText: "Password",
                fieldIcon: Icons.lock,
                isPassword: true,
                isEmail: false,
              ),
            ),
            const SizedBox(height: 10,),
            PickRole(controller: _roleController,),
            const SizedBox(
              height: 30,
            ),
            RegistrationButton(
              formKey: _formKey,
              fullNameController: _fullNameController,
              emailController: _emailController,
              passwordController: _passwordController,
              roleController: _roleController,
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do you have an account?"),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => SignInScreen()));
                  },
                  child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
