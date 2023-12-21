import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shop_ui/features/shop/data/datasource/shop_remoteDatasource.dart';
import 'package:shop_ui/features/shop/domain/models/add_shop.model.dart';
import 'package:shop_ui/features/shop/domain/models/shop_model.dart';

class ShopRepository {
  late ShopRemoteDatasource _shopRemoteDatasource;
  ShopRepository(ShopRemoteDatasource shopRemoteDatasource) {
    _shopRemoteDatasource = shopRemoteDatasource;
  }
  Future<Either<String, int>> addShop(AddShopModel addShopModel) async {
    try {
      final response = await _shopRemoteDatasource.addShopRepo(addShopModel);
      final decodedResponse = jsonDecode(response.body);
      return Right(decodedResponse['id']);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ShopModel>>> getShop() async {
    try {
      final response = await _shopRemoteDatasource.getShopRepo();
      final decodedResult = jsonDecode(response.body);
      // print(decodedResult);
      final result1 = decodedResult as List;
      List<ShopModel> fresult =
          result1.map(((e) => ShopModel.fromJson(e))).toList();
      return Right(fresult);
    } catch (e) {
      print('$e shop repo');
      return Left(e.toString());
    }
  }
}
