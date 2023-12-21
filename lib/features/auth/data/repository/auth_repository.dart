import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/auth/data/datasource/auth_local.datasource.dart';
import 'package:shop_ui/features/auth/domain/models/login.model.dart';
import 'package:shop_ui/features/auth/domain/models/register.model.dart';

class AuthRepository {
  late AuthlocalDatasource _authlocalDatasource;

  AuthRepository(AuthlocalDatasource authlocalDatasource) {
    _authlocalDatasource = authlocalDatasource;
  }

  Future<Either<String, int>> login(LoginModel loginModel) async {
    try {
      final response = await http.post(
        Uri.parse('${Config.url}/login'),
        body: jsonEncode({
          'branchId': loginModel.branchId,
          'empId': loginModel.empId,
          'password': loginModel.password,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer token'
        },
      );
      final data = jsonDecode(response.body);
      // print('${response.statusCode} login');

      _authlocalDatasource.saveToken(data['authorization']['token']);

      return Right(response.statusCode);
    } catch (e) {
      print('$e auth repo');
      return Left(e.toString());
    }
  }

  Future<Either<String, dynamic>> register(RegisterModel registerModel) async {
    try {
      final response =
          await http.post(Uri.parse('${Config.url}/register'), body: {
        'branchId': registerModel.branchId,
        'empId': registerModel.empId,
        'lastName': registerModel.lastName,
        'firstName': registerModel.firstName,
        'middleName': registerModel.middleName,
        'password': registerModel.password,
        'status': registerModel.status,
        'dateHired': registerModel.dateHired,
        'salary': registerModel.salary,
        'notes': registerModel.notes,
        'remark': registerModel.remark,
      });
      final data = jsonDecode(response.body);
      _authlocalDatasource.saveToken(data['token']);
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
