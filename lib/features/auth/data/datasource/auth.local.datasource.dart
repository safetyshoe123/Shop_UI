import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_ui/config.dart';

class AuthlocalDatasource {
  late FlutterSecureStorage _secureStorage;

  AuthlocalDatasource(FlutterSecureStorage secureStorage) {
    _secureStorage = secureStorage;
  }
//Saving token called in repository
  Future<Unit> saveToken(String token) async {
    await _secureStorage.write(key: Config.userToken, value: token);
    return unit;
  }

//for Auto Login
  Future<String?> getUserToken() async {
    return _secureStorage.read(key: Config.userToken);
  }

  //**
  //NOT USED BUT DON'T ERASE COMMENT MIGHT USE IT SOMEDAY
  // */
  Future<String?> getUser() async {
    return _secureStorage.read(key: Config.userToken);
  }

//for logout
  Future<Unit> deleteToken() async {
    _secureStorage.delete(key: Config.userToken);
    return unit;
  }
}
