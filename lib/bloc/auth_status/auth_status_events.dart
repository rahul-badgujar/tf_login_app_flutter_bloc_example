part of 'auth_status_bloc.dart';

abstract class AuthStatusEvent extends Equatable {
  const AuthStatusEvent();

  @override
  List<Object> get props => [];
}

class LoginWithEmailPassword extends AuthStatusEvent {
  final String email;
  final String password;

  const LoginWithEmailPassword({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignupWithEmailPassword extends AuthStatusEvent {
  final String email;
  final String password;

  const SignupWithEmailPassword({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class Logout extends AuthStatusEvent {
  const Logout();

  @override
  List<Object> get props => [];
}

class PersistedAuthStatusCheck extends AuthStatusEvent {
  const PersistedAuthStatusCheck();
  @override
  List<Object> get props => [];
}
