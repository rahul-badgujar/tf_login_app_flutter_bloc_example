// ignore_for_file: prefer_const_declarations

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_page_bloc/auth/auth_service.dart';
import 'package:login_page_bloc/utils/util_funcs.dart';

part 'auth_status_events.dart';
part 'auth_status_states.dart';

class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  // ! Auth service can be switched by changing this member variable value
  final AuthService authService;

  AuthStatusBloc({required this.authService}) : super(Authenticated()) {
    on<LoginWithEmailPassword>(_onLoginWithEmailPassword);
    on<SignupWithEmailPassword>(_onSignupWithEmailPassword);
    on<Logout>(_onLogout);
    on<PersistedAuthStatusCheck>(_onPersistedAuthStatusCheck);
  }

  Future<void> _onLoginWithEmailPassword(
      LoginWithEmailPassword event, Emitter<AuthStatusState> emit) async {
    try {
      await authService.loginWithEmailPassword(
          email: event.email, password: event.password);
      emit(Authenticated());
    } catch (e) {
      // handle error here
    }
  }

  Future<void> _onSignupWithEmailPassword(
      SignupWithEmailPassword event, Emitter<AuthStatusState> emit) async {
    try {
      await authService.signupWithEmailPassword(
          email: event.email, password: event.password);
      emit(Authenticated());
    } catch (e) {
      // handle error here
    }
  }

  Future<void> _onLogout(Logout event, Emitter<AuthStatusState> emit) async {
    try {
      await authService.logout();
      emit(NotAuthenticated());
    } catch (e) {
      // handle error here
    }
  }

  void _onPersistedAuthStatusCheck(
      PersistedAuthStatusCheck event, Emitter<AuthStatusState> emit) {
    // add your logic here to check if user is already logged in or not when app starts
    // for persistant storage, shared preferences or hive can be used.

    // for now let us assume we are not persisting auth status
    final isAlreadyLoggedIn = false;

    // ignore: dead_code
    if (isAlreadyLoggedIn) {
      emit(Authenticated());
    } else {
      emit(NotAuthenticated());
    }
  }
}
