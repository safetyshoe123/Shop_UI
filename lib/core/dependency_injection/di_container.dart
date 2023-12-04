import 'package:shop_ui/features/shop/data/repository/shop_repository.dart';
import 'package:shop_ui/features/shop/domain/bloc/shop_bloc.dart';

class DIContainer {
  ShopRepository get _shopRepository => ShopRepository();

  ShopBloc get shopBloc => ShopBloc(_shopRepository);
}