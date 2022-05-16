import 'package:bloc/bloc.dart';
import 'package:login_page_bloc/auth/auth_service.dart';

import 'auth_states.dart';

class AuthStateCubit extends Cubit<AuthState> {
  // auth service will depend on the value of this field
  final AuthService authService;

  AuthStateCubit({required this.authService}) : super(NotAuthenticated());

  Future<void> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      await authService.loginWithEmailPassword(
          email: email, password: password);
      emit(Authenticated());
    } catch (e) {
      // handle error here
    }
  }

  Future<void> logout() async {
    try {
      await authService.logout();
      emit(NotAuthenticated());
    } catch (e) {
      // handle error here
    }
  }
}
