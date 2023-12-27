import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shop_ui/features/branch/data/datasource/branch_remoteDatesource.dart';
import 'package:shop_ui/features/branch/domain/models/addbranch.model.dart';
import 'package:shop_ui/features/branch/domain/models/branch.model.dart';

class BranchRepository {
  late BranchRemoteDataSource _branchRemoteDataSource;
  BranchRepository(BranchRemoteDataSource branchRemoteDataSource) {
    _branchRemoteDataSource = branchRemoteDataSource;
  }
  Future<Either<String, List<BranchModel>>> getBranch(String shopId) async {
    try {
      final response = await _branchRemoteDataSource.getBranch(shopId);

      final result = jsonDecode(response.body) as List;
      List<BranchModel> fresult =
          result.map(((e) => BranchModel.fromJson(e))).toList();

      return Right(fresult);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, int>> addShop(AddBranchModel addBranchModel) async {
    try {
      final response = await _branchRemoteDataSource.addBranch(addBranchModel);
      final data = jsonDecode(response.body);

      return Right(data['id']);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
