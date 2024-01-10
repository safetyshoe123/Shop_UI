import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/auth/data/datasource/auth.local.datasource.dart';
import 'package:shop_ui/features/shop/domain/models/add_shop.model.dart';

class ShopRemoteDatasource {
  late AuthlocalDatasource _authlocalDatasource;
  ShopRemoteDatasource(AuthlocalDatasource authlocalDatasource) {
    _authlocalDatasource = authlocalDatasource;
  }
  Future<Response> addShopRepo(AddShopModel addShopModel) async {
    String? token = await _authlocalDatasource.getToken();

    final response = await post(Uri.parse('${Config.url}/create'),
        body: jsonEncode({
          'shopId': addShopModel.shopId,
          'shopName': addShopModel.shopName,
          'address1': addShopModel.address1,
          'address2': addShopModel.address2,
          'notes': addShopModel.notes,
          'remark': addShopModel.remark,
        }),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        });

    final data = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return response;
      case 401:
        throw (data['message']);
      case 500:
        throw ('Can\'t add Shop! Something went wrong!');
      default:
        throw (data['message']);
    }
  }

  Future<Response> getShopRepo() async {
    String? token = await _authlocalDatasource.getToken();

    final response = await get(Uri.parse('${Config.url}/index'), headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    final data = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return response;
      case 401:
        throw (data['message']);
      case 500:
        throw ('Can\'t load Shop! Something went wrong!');
      default:
        throw (data['message']);
    }
  }
}
