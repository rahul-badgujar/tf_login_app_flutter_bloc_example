import 'package:bloc/bloc.dart';
import 'package:login_page_bloc/auth/email_password_login.dart';
import 'package:login_page_bloc/auth/email_password_login_postgres_impl.dart';

import 'auth_states.dart';

class LoginCubit extends Cubit<LoginState> {
  // chosing postgres auth for login here, can change from here
  final EmailPasswordLogin loginService = EmailPasswordLoginPostgresImpl();

  LoginCubit() : super(LoginIdle());

  Future<void> login({required String email, required String password}) async {
    try {
      await loginService.login(email: email, password: password);
      emit(LoginSuccessfull());
    } on Exception catch (e) {
      emit(LoginFailed(message: e.toString()));
    }
  }
}
