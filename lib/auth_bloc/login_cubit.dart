import 'package:bloc/bloc.dart';

import 'auth_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginIdle());
}
