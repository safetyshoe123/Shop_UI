import 'package:shop_ui/features/auth/data/datasource/auth_local.datasource.dart';
import 'package:shop_ui/features/auth/data/repository/auth_repository.dart';
import 'package:shop_ui/features/auth/domain/bloc/auth_bloc.dart';
import 'package:shop_ui/features/branch/data/repository/branch.repository.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_ui/features/shop/data/datasource/shop_remoteDatasource.dart';
import 'package:shop_ui/features/shop/data/repository/shop_repository.dart';
import 'package:shop_ui/features/shop/domain/bloc/shop_bloc.dart';

class DIContainer {
  FlutterSecureStorage get _secureStorage => const FlutterSecureStorage();
  // SharedPreferences get _sharedPrefs => const SharedPreferences();

  AuthlocalDatasource get _authLocalDatasource =>
      AuthlocalDatasource(_secureStorage);
  AuthRepository get _authRepository => AuthRepository(_authLocalDatasource);

  AuthBloc get authBloc => AuthBloc(_authRepository);

  ShopRemoteDatasource get _shopRemoteDatasource =>
      ShopRemoteDatasource(_authLocalDatasource);

  ShopRepository get _shopRepository => ShopRepository(_shopRemoteDatasource);

  ShopBloc get shopBloc => ShopBloc(_shopRepository);

  BranchRepository get _branchRepository => BranchRepository();

  BranchBloc get branchBloc => BranchBloc(_branchRepository);
}
