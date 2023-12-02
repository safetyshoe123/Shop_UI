import 'package:flutter/material.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/features/data/repository/shop_repository.dart';
import 'package:shop_ui/features/domain/models/shop_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_state.dart';
part 'shop_event.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc(ShopRepository shopRepository) : super(ShopState.inital()) {
    on<GetShopEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      final result = await shopRepository.getShop();
      try {
        emit(state.copyWith(shopModel: result));
        // emit(state.copyWith(stateStatus: StateStatus.loaded));
      } catch (e) {
        print(e);
        // emit(ShopErrorState(e.toString()));
        emit(state.copyWith(errorMessage: e.toString()));
      }
      emit(state.copyWith(stateStatus: StateStatus.loaded));
    });
  }
}