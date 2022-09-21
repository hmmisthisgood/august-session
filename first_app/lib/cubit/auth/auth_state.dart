import 'package:flutter/material.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final String loadingMessage;
  AuthLoading({required this.loadingMessage});
}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});
}

class AuthSuccess extends AuthState {
  final user;

  AuthSuccess({this.user});
}
