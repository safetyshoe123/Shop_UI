// ignore_for_file: prefer_const_constructors_in_immutables

part of 'auth_bloc.dart';

@immutable
class AuthState {
  final StateStatus stateStatus;
  final String? errorMessage;
  final AuthModel? authModel;
  final String? token;
  final bool isSuccess;

  AuthState({
    required this.stateStatus,
    this.authModel,
    this.token,
    this.errorMessage,
    required this.isSuccess,
  });

  factory AuthState.inital() =>
      AuthState(stateStatus: StateStatus.initial, isSuccess: false);

  AuthState copyWith({
    StateStatus? stateStatus,
    String? errorMessage,
    AuthModel? authModel,
    String? token,
    bool? isSuccess,
  }) {
    return AuthState(
      stateStatus: stateStatus ?? this.stateStatus,
      authModel: authModel ?? this.authModel,
      token: token ?? this.token,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
