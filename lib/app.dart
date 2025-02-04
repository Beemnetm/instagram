import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/authentication/data/firebase_auth_repo.dart';
//import 'package:instagram/features/authentication/domain/repos/auth_repo.dart';
import 'package:instagram/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:instagram/features/authentication/presentation/cubits/auth_states.dart';
import 'package:instagram/features/authentication/presentation/pages/auth_page.dart';
import 'package:instagram/post/presentation/pages/home_page.dart';
import 'package:instagram/themes/light_mode.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = FirebaseAuthRepo();
    return BlocProvider(
      create: (context) =>
          AuthCubit(authRepo: authRepo)..checkAuth(), // Fixed instantiation
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthState>(
            // Added listener (even if empty)
            builder: (context, authState) {
          print(authState); // Debugging the current auth state

          if (authState is Unauthenticated) {
            return AuthPage();
          }

          if (authState is Authenticated) {
            return HomePage();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }, listener: (context, State) {
          if (State is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(State.message)));
          }
        }),
      ),
    );
  }
}
