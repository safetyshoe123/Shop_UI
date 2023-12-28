import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/auth/data/datasource/auth.local.datasource.dart';
import 'package:shop_ui/features/auth/domain/models/login.model.dart';
import 'package:shop_ui/features/auth/domain/models/register.model.dart';

class AuthRemoteDatasource {
  late AuthlocalDatasource _authlocalDatasource;

  AuthRemoteDatasource(AuthlocalDatasource authlocalDatasource) {
    _authlocalDatasource = authlocalDatasource;
  }

  Future<Response> login(LoginModel loginModel) async {
    String? token = await _authlocalDatasource.getUserToken();

    final response = await post(
      Uri.parse('${Config.url}/login'),
      body: jsonEncode({
        'branchId': loginModel.branchId,
        'empId': loginModel.empId,
        'password': loginModel.password,
      }),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    final data = jsonDecode(response.body);

    _authlocalDatasource.saveToken(data['authorization']['token']);

    return response;
  }

  Future<Response> register(RegisterModel registerModel) async {
    String? token = await _authlocalDatasource.getUserToken();

    final response = await post(
      Uri.parse('${Config.url}/register'),
      body: jsonEncode({
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
      }),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    return response;
  }
}
