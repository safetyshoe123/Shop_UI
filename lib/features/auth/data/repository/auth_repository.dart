import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shop_ui/features/auth/data/datasource/auth_local.datasource.dart';
import 'package:shop_ui/features/auth/data/datasource/auth_remoteDatasource.dart';
import 'package:shop_ui/features/auth/domain/models/auth_model.dart';
import 'package:shop_ui/features/auth/domain/models/login.model.dart';
import 'package:shop_ui/features/auth/domain/models/register.model.dart';

class AuthRepository {
  late AuthRemoteDatasource _authRemoteDatasource;
  late AuthlocalDatasource _authlocalDatasource;

  AuthRepository(AuthRemoteDatasource authRemoteDatasource,
      AuthlocalDatasource authlocalDatasource) {
    _authRemoteDatasource = authRemoteDatasource;
    _authlocalDatasource = authlocalDatasource;
  }

  Future<Either<String, AuthModel>> loginRepo(LoginModel loginModel) async {
    try {
      final response = await _authRemoteDatasource.login(loginModel);
      final res = jsonDecode(response.body);

      final Map<String, dynamic> resMap = res['user'];
      final result = AuthModel.fromJson(resMap);
      return Right(result);
    } catch (e) {
      print('$e auth repo');
      return Left(e.toString());
    }
  }

  Future<Either<String, AuthModel>> register(
      RegisterModel registerModel) async {
    try {
      final response = await _authRemoteDatasource.register(registerModel);

      final data = jsonDecode(response.body);
      final Map<String, dynamic> resMap = data['user'];
      final result = AuthModel.fromJson(resMap);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String?>> autoLogin() async {
    try {
      final result = await _authlocalDatasource.getUserToken();
      print('$result autologin');

      if (result == null) return const Right(null);

      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
