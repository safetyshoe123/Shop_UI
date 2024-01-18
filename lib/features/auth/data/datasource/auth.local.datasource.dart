import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/auth/domain/models/auth_model.dart';

class AuthlocalDatasource {
  late FlutterSecureStorage _secureStorage;

  AuthlocalDatasource(FlutterSecureStorage secureStorage) {
    _secureStorage = secureStorage;
  }
//Saving token/user called in repository
  Future<Unit> saveToken(String token) async {
    try {
      await _secureStorage.write(key: Config.userToken, value: token);
      return unit;
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<Unit> saveUser(AuthModel authModel) async {
    try {
      await _secureStorage.write(
          key: Config.user, value: AuthModel.serialize(authModel));
      return unit;
    } catch (e) {
      throw (e.toString);
    }
  }

//for Auto Login
  Future<String?> getUserToken() async {
    try {
      return await _secureStorage.read(key: Config.userToken);
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<String?> getUser() async {
    try {
      return await _secureStorage.read(key: Config.user);
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<Unit> containsKey() async {
    try {
      if (await _secureStorage.containsKey(key: Config.userToken)) {
        await _secureStorage.delete(key: Config.userToken);
      }
      return unit;
    } catch (e) {
      throw e.toString();
    }
  }

//for logout
  Future<Unit> deleteToken() async {
    try {
      await _secureStorage.delete(key: Config.userToken);
      return unit;
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<Unit> deleteUser() async {
    try {
      await _secureStorage.delete(key: Config.user);
      return unit;
    } catch (e) {
      throw (e.toString());
    }
  }
}
