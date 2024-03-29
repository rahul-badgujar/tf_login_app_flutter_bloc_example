import 'package:login_page_bloc/auth/auth_service.dart';
import 'package:login_page_bloc/utils/util_funcs.dart';

class AuthServiceFirebaseImpl implements AuthService {
  // keep your api keys related to firebase login here
  @override
  Future<void> loginWithEmailPassword(
      {required String email, required String password}) {
    // mock error
    bool showThrowError = generateRandomInt(end: 5) == 0;
    if (showThrowError) throw "Something went wrong!";
    // mock delay
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> logout() {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> signupWithEmailPassword(
      {required String email, required String password}) {
    // mock error
    bool showThrowError = generateRandomInt(end: 5) == 0;
    if (showThrowError) throw "Something went wrong!";
    // mock delay
    return Future.delayed(const Duration(seconds: 3));
  }
}
