//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Added missing import
import 'package:instagram/features/authentication/domain/entities/app_user.dart';
import 'package:instagram/features/authentication/domain/repos/auth_repo.dart';
import 'package:instagram/features/authentication/presentation/cubits/auth_states.dart';

// Fixed incorrect superclass (Cubit's name should start with uppercase 'C')
class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();

    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(
          Unauthenticated()); // Fixed typo ("unathenticated" → "Unauthenticated")
    }
  }

  AppUser? get currentUser => _currentUser;

  Future<void> login(String email, String pw) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithEmailPassword(
          email, pw); // Fixed variable name (User → user)

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(
          Unauthenticated()); // Fixed misplaced semicolon and unnecessary extra emit
    }
  }

  Future<void> register(String name, String email, String pw) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.registerWithEmailPassword(
          name, email, pw); // Fixed variable name (User → user)

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(
          Unauthenticated()); // Fixed misplaced semicolon and unnecessary extra emit
    }
  }

  Future<void> logout() async {
    authRepo.logout();
    emit(Unauthenticated());
  }
}
