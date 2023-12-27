import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shop_ui/features/auth/data/datasource/auth_remoteDatasource.dart';
import 'package:shop_ui/features/auth/domain/models/login.model.dart';
import 'package:shop_ui/features/auth/domain/models/register.model.dart';

class AuthRepository {
  late AuthRemoteDatasource _authRemoteDatasource;

  AuthRepository(AuthRemoteDatasource authRemoteDatasource) {
    _authRemoteDatasource = authRemoteDatasource;
  }

  Future<Either<String, int>> loginRepo(LoginModel loginModel) async {
    try {
      final response = await _authRemoteDatasource.login(loginModel);
      if (response.statusCode == 200) {
        print('success');
      } else {
        return Right(response.statusCode);
      }

      // List<AuthModel> fresult =
      //     result.map(((e) => AuthModel.fromJson(e))).toList();

      return Right(response.statusCode);
    } catch (e) {
      print('$e auth repo');
      return Left(e.toString());
    }
  }

  Future<Either<String, int>> register(RegisterModel registerModel) async {
    try {
      final response = await _authRemoteDatasource.register(registerModel);

      final data = jsonDecode(response.body);
      // final dataList = data as List;
      // final dataToModel = dataList.map((e) => AuthModel.fromJson(e)).toList();
      return Right(data['id']);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
