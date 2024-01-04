// ignore_for_file: prefer_const_constructors_in_immutables

part of 'auth_bloc.dart';

@immutable
class AuthState {
  final StateStatus stateStatus;
  final String? errorMessage;
  final AuthModel? authModel;
  final String? token;

  AuthState({
    required this.stateStatus,
    this.authModel,
    this.token,
    this.errorMessage,
  });

  factory AuthState.inital() => AuthState(stateStatus: StateStatus.initial);

  AuthState copyWith({
    StateStatus? stateStatus,
    String? errorMessage,
    AuthModel? authModel,
    String? token,
  }) {
    return AuthState(
      stateStatus: stateStatus ?? this.stateStatus,
      authModel: authModel ?? this.authModel,
      token: token ?? this.token,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
