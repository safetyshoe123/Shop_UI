part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginModel loginModel;
  LoginEvent({required this.loginModel});
}

class RegisterEvent extends AuthEvent {
  final RegisterModel registerModel;

  RegisterEvent({required this.registerModel});
}

class AutoLoginEvent extends AuthEvent {}
