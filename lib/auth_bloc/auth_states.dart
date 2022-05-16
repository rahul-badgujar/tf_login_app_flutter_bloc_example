import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthActionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthActionIdle extends AuthActionState {}

class AuthChangeInitiated extends AuthActionState {}

class AuthActionSuccessfull extends AuthActionState {}

class AuthChangeFailed extends AuthActionState {
  final String message;
  AuthChangeFailed({required this.message});
}
