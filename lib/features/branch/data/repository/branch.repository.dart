import 'package:dartz/dartz.dart';
import 'package:shop_ui/features/branch/data/datasource/branch.remoteDatesource.dart';
import 'package:shop_ui/features/branch/domain/models/addbranch.model.dart';
import 'package:shop_ui/features/branch/domain/models/branch.model.dart';

class BranchRepository {
  late BranchRemoteDataSource _branchRemoteDataSource;
  BranchRepository(BranchRemoteDataSource branchRemoteDataSource) {
    _branchRemoteDataSource = branchRemoteDataSource;
  }
  Future<Either<String, List<BranchModel>>> getBranchADM(String shopId) async {
    try {
      final listResponse = await _branchRemoteDataSource.getBranchADM(shopId);

      return Right(listResponse);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, BranchModel>> getBranch(String shopId) async {
    try {
      final listResponse = await _branchRemoteDataSource.getBranch(shopId);

      return Right(listResponse);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, int>> addShop(AddBranchModel addBranchModel) async {
    try {
      final idResponse =
          await _branchRemoteDataSource.addBranch(addBranchModel);

      return Right(idResponse);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
