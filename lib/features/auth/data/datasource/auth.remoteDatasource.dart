import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/auth/data/datasource/auth.local.datasource.dart';
import 'package:shop_ui/features/auth/domain/models/auth_model.dart';
import 'package:shop_ui/features/auth/domain/models/login.model.dart';
import 'package:shop_ui/features/auth/domain/models/register.model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRemoteDatasource {
  late AuthlocalDatasource _authlocalDatasource;

  AuthRemoteDatasource(AuthlocalDatasource authlocalDatasource) {
    _authlocalDatasource = authlocalDatasource;
  }

  Future<AuthModel> login(LoginModel loginModel) async {
    String? token = await _authlocalDatasource.getUserToken();

    final response = await http.post(
      Uri.parse('${Config.url}/login'),
      body: jsonEncode({
        'shopId': loginModel.shopId,
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
    switch (response.statusCode) {
      case 200:
        await _authlocalDatasource.saveToken(data['authorization']['token']);

        final Map<String, dynamic> resMap = data['user'];
        final result = AuthModel.fromJson(resMap);
        await _authlocalDatasource.saveUser(result);

        return result;
      case 500:
        throw ('Can\'t login! Something went wrong!');

      default:
        throw (data['message']);
    }
  }

  Future<AuthModel> register(RegisterModel registerModel) async {
    String? token = await _authlocalDatasource.getUserToken();

    final response = await http.post(
      Uri.parse('${Config.url}/register'),
      body: jsonEncode({
        'shopId': registerModel.shopId,
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
    final data = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        await _authlocalDatasource.saveToken(data['authorization']['token']);

        final Map<String, dynamic> resMap = data['user'];
        final result = AuthModel.fromJson(resMap);

        await _authlocalDatasource.saveUser(result);

        return result;
      case 500:
        throw ('Can\'t register! Something went wrong!');

      default:
        throw (data['message']);
    }
  }

  Future<int> logout() async {
    try {
      final token = await _authlocalDatasource.getUserToken();
      if (token == null || token.isEmpty) {
        throw ('Token is null or empty');
      }

      final response = await http.post(
        Uri.parse('${Config.url}/logout'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );
      final data = jsonDecode(response.body);
      final statusCode = response.statusCode;
      switch (response.statusCode) {
        case 200:
          return statusCode;
        case 500:
          throw ('Can\'t logout! Something went wrong!');
        case 401:
          if (JwtDecoder.isExpired(token)) {
            return await refreshToken();
          }
          throw (data['message']);
        default:
          throw (data['message']);
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<int> refreshToken() async {
    final refreshToken = await _authlocalDatasource.getUserToken();

    if (refreshToken == null || refreshToken.isEmpty) {
      throw ('Token is null or empty');
    }

    final response = await http.post(
      Uri.parse('${Config.url}/refresh'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $refreshToken',
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      await _authlocalDatasource.saveToken(data['authorization']['token']);
      return response.statusCode;
    } else {
      await _authlocalDatasource.deleteToken();
      await _authlocalDatasource.deleteUser();
    }
    return response.statusCode;
  }
}
