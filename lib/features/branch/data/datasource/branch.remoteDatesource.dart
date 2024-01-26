import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shop_ui/config.dart';
import 'package:shop_ui/features/auth/data/datasource/auth.local.datasource.dart';
import 'package:shop_ui/features/branch/domain/models/addbranch.model.dart';
import 'package:shop_ui/features/branch/domain/models/branch.model.dart';

class BranchRemoteDataSource {
  late AuthlocalDatasource _authlocalDatasource;
  BranchRemoteDataSource(AuthlocalDatasource authlocalDatasource) {
    _authlocalDatasource = authlocalDatasource;
  }

  Future<List<BranchModel>> getBranchADM(String shopId) async {
    String? token = await _authlocalDatasource.getUserToken();
    final response =
        await http.get(Uri.parse('${Config.url}/showBranch/$shopId'), headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
    });

    final data = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        final result = jsonDecode(response.body) as List;
        List<BranchModel> fresult =
            result.map(((e) => BranchModel.fromJson(e))).toList();

        return fresult;
      case 401:
        throw (data['message']);
      case 500:
        throw ('Can\'t load Branch! Something went wrong!');
      default:
        throw (data['message']);
    }
  }

  Future<BranchModel> getBranch(String shopId) async {
    String? token = await _authlocalDatasource.getUserToken();
    final response =
        await http.get(Uri.parse('${Config.url}/getBranch/$shopId'), headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
    });

    final data = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        final Map<String, dynamic> branchMap = data;
        final result = BranchModel.fromJson(branchMap);
        return result;
      case 401:
        throw (data['message']);
      case 500:
        throw ('Can\'t load Branch! Something went wrong!');
      default:
        throw (data['message']);
    }
  }

  Future<int> addBranch(AddBranchModel addBranchModel) async {
    String? token = await _authlocalDatasource.getUserToken();

    final response = await http.post(Uri.parse('${Config.url}/createBranch'),
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
    final data = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        final id = data['id'];
        return id;
      case 401:
        throw (data['message']);
      case 500:
        throw ('Can\'t add Branch! Something went wrong!');
      default:
        throw (data['message']);
    }
  }
}
