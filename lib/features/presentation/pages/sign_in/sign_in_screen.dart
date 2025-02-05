import 'package:flutter/cupertino.dart';

import '../../../../sources.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(
              height: 120,
            ),
            Center(
              child: Text(
                "Teachers rating!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: UniversalField(
                controller: _emailController,
                hintText: "E-mail",
                fieldIcon: Icons.mail,
                isPassword: false,
                isEmail: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: UniversalField(
                controller: _passwordController,
                hintText: "Password",
                fieldIcon: Icons.lock,
                isPassword: true,
                isEmail: false,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context) => ForgotPassword(),barrierDismissible: false,);
              },
              child: Text(
                "Forgot password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            LoginButton(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
