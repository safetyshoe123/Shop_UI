import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shop_ui/features/auth/data/datasource/auth.local.datasource.dart';
import 'package:shop_ui/features/auth/data/datasource/auth.remoteDatasource.dart';
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
      _authlocalDatasource.saveUser(result);
      return Right(result);
    } catch (e) {
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

  Future<Either<String, AuthModel?>> autoLogin() async {
    try {
      final result = await _authlocalDatasource.getUser();
      print(result);
      if (result == null) return const Right(null);

      AuthModel? authModel = AuthModel.deserialize(result);

      return Right(authModel);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Unit>> logout() async {
    try {
      final result = await _authRemoteDatasource.logout();
      final data = jsonDecode(result.body);
      print(data);
      if (result.statusCode == 200) {
        _authlocalDatasource.deleteUser();
        _authlocalDatasource.deleteToken();
      }

      print(data);
      return const Right(unit);
    } catch (e) {
      print('$e this error from auth repo logout');
      return Left(e.toString());
    }
  }
}
