// ignore_for_file: prefer_const_constructors_in_immutables

part of 'auth_bloc.dart';

@immutable
class AuthState {
  final StateStatus stateStatus;
  final String? errorMessage;
  final List<AuthModel> authModel;
  final bool isSuccess;

  AuthState({
    required this.stateStatus,
    required this.authModel,
    this.errorMessage,
    required this.isSuccess,
  });

  factory AuthState.inital() => AuthState(
      stateStatus: StateStatus.initial, isSuccess: false, authModel: const []);

  AuthState copyWith({
    StateStatus? stateStatus,
    String? errorMessage,
    List<AuthModel>? authModel,
    bool? isSuccess,
  }) {
    return AuthState(
      stateStatus: stateStatus ?? this.stateStatus,
      authModel: authModel ?? this.authModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
