import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/authentication/presentation/components/my_button.dart';
import 'package:instagram/features/authentication/presentation/components/my_text_field.dart';
import 'package:instagram/features/authentication/presentation/cubits/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  final void Function() togglePages; // Changed to non-nullable
  const RegisterPage({
    super.key,
    required this.togglePages,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final pwConfirmController = TextEditingController();
  final nameController = TextEditingController();

  void register() {
    final String name = nameController.text;
    final String email = emailController.text;
    final String pw = pwController.text;
    final String pwConfirm = pwConfirmController.text;

    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty &&
        name.isNotEmpty &&
        pw.isNotEmpty &&
        pwConfirm.isNotEmpty) {
      if (pw == pwConfirm) {
        authCubit.register(name, email, pw);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("password missmatch")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("please complete all fields")));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwController.dispose();
    pwConfirmController.dispose();
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Register ! Enjoy it all",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                      controller: nameController,
                      hintText: "name",
                      obscureText: false),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: pwController,
                    hintText: "Email",
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: pwConfirmController,
                    hintText: "password",
                    obscureText: true,
                  ),
                  SizedBox(height: 15),
                  MyButton(onTap: register, text: "Register"),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member ?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      GestureDetector(
                        onTap: widget.togglePages,
                        child: Text(
                          "Login now",
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
    ));
  }
}
