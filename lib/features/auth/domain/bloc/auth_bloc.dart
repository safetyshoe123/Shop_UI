import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/features/auth/data/repository/auth_repository.dart';
import 'package:shop_ui/features/auth/domain/models/auth_model.dart';
import 'package:shop_ui/features/auth/domain/models/login.model.dart';
import 'package:shop_ui/features/auth/domain/models/register.model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthRepository authRepository) : super(AuthState.inital()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      final Either<String, int> result =
          await authRepository.loginRepo(event.loginModel);

      result.fold((error) {
        emit(state.copyWith(stateStatus: StateStatus.error));
        emit(state.copyWith(stateStatus: StateStatus.loaded));
      }, (decodedUser) {
        if (decodedUser == 200) {
          // final authModel = state.authModel;
          // print(authModel);
          emit(state.copyWith(
            // authModel: [...authModel],
            stateStatus: StateStatus.loaded,
            isSuccess: true,
          ));
        } else {
          emit(state.copyWith(
              stateStatus: StateStatus.error, errorMessage: 'Unable to login'));
          emit(state.copyWith(stateStatus: StateStatus.loaded));
        }
      });
    });
    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      final Either<String, int> result =
          await authRepository.register(event.registerModel);

      result.fold((error) {
        emit(state.copyWith(stateStatus: StateStatus.error));
        emit(state.copyWith(stateStatus: StateStatus.loaded));
      }, (registerModel) {
        final listModel = state.authModel;
        emit(state.copyWith(authModel: [
          ...listModel,
          AuthModel(
            id: registerModel,
            branchId: event.registerModel.branchId,
            empId: event.registerModel.empId,
            lastName: event.registerModel.lastName,
            firstName: event.registerModel.firstName,
            middleName: event.registerModel.middleName,
            password: event.registerModel.password,
            status: event.registerModel.status,
            dateHired: event.registerModel.dateHired,
            salary: event.registerModel.salary,
            notes: event.registerModel.notes,
            remark: event.registerModel.remark,
          )
        ], stateStatus: StateStatus.loaded));
      });
    });
  }
}
