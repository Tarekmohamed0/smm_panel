import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smm_panel/src/core/config/config.dart';
import 'package:smm_panel/src/core/utils/auth_services.dart';
import 'package:smm_panel/src/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  final AuthServices _authServices = sl<AuthServices>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> login(
      {required String email,
      required String password,
      required String role}) async {
    emit(const LoginState.loading());
    try {
      final user = await _authServices.signInWithEmailAndPassword(
        email,
        password,
      );

      if (!isClosed) {
        if (user != null) {
          // await savedata(email, password, role);
          final userdata =
              await _firestore.collection('users').doc(user.uid).get();
          if (userdata.get('role') == 'user') {
            emit(LoginState.loggedIn(user, userdata.get('role')));
          } else {
            emit(LoginState.loggedIn(user, userdata.get('role')));
          }
        } else {
          emit(const LoginState.error("Error logging in"));
        }
      }
    } on FirebaseAuthException catch (e) {
      if (!isClosed) {
        if (e.code == 'weak-password') {
          emit(const LoginState.error("The password provided is too weak"));
        } else if (e.code == 'email-already-in-use') {
          emit(const LoginState.error(
              "The account already exists for that email"));
        } else {
          emit(LoginState.error(e.message ?? "Error logging in"));
        }
      }
    } finally {
      if (!isClosed) {
        emit(const LoginState.initial());
      }
    }
  }

  Future<void> savedata(String email, String password, String role) async {
    try {
      await _authServices.savedata(email, password, role);
    } catch (e) {
      if (!isClosed) {
        emit(const LoginState.error("Error saving data"));
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
