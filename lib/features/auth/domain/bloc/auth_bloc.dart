import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/features/auth/data/repository/auth_repository.dart';
import 'package:shop_ui/features/auth/domain/models/auth_model.dart';
import 'package:shop_ui/features/auth/domain/models/login.model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthRepository authRepository) : super(AuthState.inital()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      final Either<String, int> result =
          await authRepository.login(event.loginModel);

      result.fold((error) {
        emit(state.copyWith(stateStatus: StateStatus.error));
        emit(state.copyWith(stateStatus: StateStatus.loaded));
      }, (userLogin) {
        final currentAuthModel = state.authModel;
        if (userLogin == 200) {
          emit(state.copyWith(
            authModel: currentAuthModel,
            stateStatus: StateStatus.loaded,
            isSuccess: true,
          ));
        } else {
          emit(
              state.copyWith(stateStatus: StateStatus.error, isSuccess: false));
          emit(state.copyWith(stateStatus: StateStatus.loaded));
        }
      });
    });
  }
}
