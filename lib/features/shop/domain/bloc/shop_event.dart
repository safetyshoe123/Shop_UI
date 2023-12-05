part of 'shop_bloc.dart';

@immutable
sealed class ShopEvent {}

class GetShopEvent extends ShopEvent {
  
}
class AddShopEvent extends ShopEvent {
  final AddShopModel addShopModel;

  AddShopEvent({
    required this.addShopModel,
  });
}