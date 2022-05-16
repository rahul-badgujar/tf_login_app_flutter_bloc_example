abstract class AuthService {
  // Login with Email and Password Credentials
  Future<void> loginWithEmailPassword(
      {required String email, required String password});
  // Logout the current user
  Future<void> logout();
}
