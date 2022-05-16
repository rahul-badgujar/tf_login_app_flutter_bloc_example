import 'package:bloc/bloc.dart';
import 'package:login_page_bloc/auth/email_password_login.dart';

import 'auth_states.dart';

class AuthStateCubit extends Cubit<AuthActionState> {
  // auth service will depend on the value of this field
  final EmailPasswordLogin loginService;

  AuthStateCubit({required this.loginService}) : super(AuthActionIdle());

  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthChangeInitiated());
      await loginService.login(email: email, password: password);
      emit(AuthActionSuccessfull());
    } catch (e) {
      emit(AuthChangeFailed(message: e.toString()));
      emit(AuthActionIdle());
    }
  }

  Future<void> logout() async {
    try {
      emit(AuthChangeInitiated());
      await loginService.logout();
      emit(AuthActionIdle());
    } catch (e) {
      emit(AuthChangeFailed(message: e.toString()));
      emit(AuthActionIdle());
    }
  }
}
