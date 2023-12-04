// ignore_for_file: prefer_const_constructors_in_immutables

part of 'shop_bloc.dart';

@immutable

 class ShopState {
  final StateStatus stateStatus;
  final String? errorMessage;
  final List<ShopModel> shopModel;

  ShopState({
    required this.stateStatus,
    required this.shopModel,
    this.errorMessage,
  });

  factory ShopState.inital() => ShopState(
    stateStatus: StateStatus.initial, 
    shopModel: const [],
    );

  ShopState copyWith({
    StateStatus? stateStatus,
    String? errorMessage,
    List<ShopModel>? shopModel,
  }) {
    return ShopState(
      stateStatus: stateStatus ?? this.stateStatus, 
      shopModel: shopModel ?? this.shopModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
 }