import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smm_panel/src/features/signup/presentation/cubit/signup_state.dart';

import '../../../../core/config/config.dart';
import '../../../../core/utils/auth_services.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState.initial());

  final AuthServices _authServices = sl<AuthServices>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp(
      {required String email,
      required String password,
      required String role}) async {
    emit(const SignupState.loading());
    try {
      final user = await _authServices.registerWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!isClosed) {
        if (user != null) {
          // await savedata(email, password, role);
          emit(SignupState.authenticated(user));
        } else {
          emit(const SignupState.unauthenticated("Error logging in"));
        }
      }
    } on FirebaseAuthException catch (e) {
      if (!isClosed) {
        if (e.code == 'weak-password') {
          emit(const SignupState.unauthenticated(
              "The password provided is too weak"));
        } else if (e.code == 'email-already-in-use') {
          emit(const SignupState.unauthenticated(
              "The account already exists for that email"));
        } else {
          emit(SignupState.unauthenticated(e.message ?? "Error logging in"));
        }
      }
    } finally {
      if (!isClosed) {
        emit(const SignupState.initial());
      }
    }
  }

  Future<void> savedata(String email, String password, String role) async {
    try {
      await _authServices.savedata(email, password, role);
    } catch (e) {
      if (!isClosed) {
        emit(const SignupState.unauthenticated("Error saving data"));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    debugPrint("LoginCubit is being closed");
    return super.close();
  }
}
