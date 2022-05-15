import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginIdle extends LoginState {}

class LoginInitiated extends LoginState {}

class LoginSuccessfull extends LoginState {}

class LoginFailed extends LoginState {
  final String message;
  LoginFailed({required this.message});
}
