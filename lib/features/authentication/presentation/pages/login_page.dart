import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/authentication/presentation/cubits/auth_cubit.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback togglePages;

  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  void login() {
    final String email = emailController.text.trim();
    final String pw = pwController.text.trim();
    final authCubit = context.read<AuthCubit>(); // Fixed variable naming

    if (email.isNotEmpty && pw.isNotEmpty) {
      authCubit.login(email, pw);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter both email and password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Icon(
                      Icons.lock_clock_rounded,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Welcome! Enjoy it all",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(height: 50),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false,
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                      controller: pwController,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    SizedBox(height: 15),
                    MyButton(onTap: login, text: "Log In"),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Not a member?",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                        GestureDetector(
                          onTap: widget.togglePages,
                          child: Text(
                            " Register now",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
