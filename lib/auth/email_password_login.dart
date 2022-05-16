abstract class EmailPasswordLogin {
  Future<void> login({required String email, required String password});
  Future<void> logout();
}
