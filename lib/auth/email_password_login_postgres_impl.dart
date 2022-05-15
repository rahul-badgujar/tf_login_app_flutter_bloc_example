import 'package:login_page_bloc/auth/email_password_login.dart';
import 'package:login_page_bloc/utils/util_funcs.dart';

class EmailPasswordLoginPostgresImpl implements EmailPasswordLogin {
  // you can keep your db connection here
  @override
  Future<void> login({required String email, required String password}) {
    // mock error
    bool showThrowError = generateRandomInt(end: 5) == 0;
    if (showThrowError) throw "Something went wrong!";
    // mock delay
    return Future.delayed(const Duration(seconds: 3));
  }
}
