part of 'auth_status_bloc.dart';

abstract class AuthStatusState extends Equatable {
  const AuthStatusState();

  @override
  List<Object> get props => [];
}

class Authenticated extends AuthStatusState {}

class NotAuthenticated extends AuthStatusState {}

class AuthOperationErrored extends AuthStatusState {
  final String message;
  const AuthOperationErrored({required this.message});

  @override
  List<Object> get props => [message];
}
