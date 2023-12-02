import 'package:shop_ui/features/data/repository/shop_repository.dart';
import 'package:shop_ui/features/domain/bloc/shop_bloc.dart';

class DIContainer {
  ShopRepository get _shopRepository => ShopRepository();

  ShopBloc get shopBloc => ShopBloc(_shopRepository);
}