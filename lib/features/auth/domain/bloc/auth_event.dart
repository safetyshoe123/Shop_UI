part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginModel loginModel;
  LoginEvent({required this.loginModel});
}
