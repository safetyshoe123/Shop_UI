import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/auth/data/datasource/auth_local.datasource.dart';
import 'package:shop_ui/features/branch/domain/models/addbranch.model.dart';

class BranchRemoteDataSource {
  late AuthlocalDatasource _authlocalDatasource;
  BranchRemoteDataSource(AuthlocalDatasource authlocalDatasource) {
    _authlocalDatasource = authlocalDatasource;
  }

  Future<Response> getBranch(String shopId) async {
    String? token = await _authlocalDatasource.getUserToken();
    final response =
        await get(Uri.parse('${Config.url}/showBranch/$shopId'), headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
    });

    return response;
  }

  Future<Response> addBranch(AddBranchModel addBranchModel) async {
    String? token = await _authlocalDatasource.getUserToken();

    final response = await post(Uri.parse('${Config.url}/createBranch'),
        body: jsonEncode({
          'shopId': addBranchModel.shopId,
          'branchId': addBranchModel.branchId,
          'branchName': addBranchModel.branchName,
          'address1': addBranchModel.address1,
          'address2': addBranchModel.address2,
          'dateOpened': addBranchModel.dateOpened,
          'type': addBranchModel.type,
          'notes': addBranchModel.notes,
          'remark': addBranchModel.remark,
        }),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        });

    return response;
  }
}
