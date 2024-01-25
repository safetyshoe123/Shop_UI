part of 'branch_bloc.dart';

@immutable
sealed class BranchEvent {}

class GetBranchADMEvent extends BranchEvent {
  final String shopId;

  GetBranchADMEvent({required this.shopId});
}

class GetBranchEvent extends BranchEvent {
  final String shopId;

  GetBranchEvent({required this.shopId});
}

class AddBranchEvent extends BranchEvent {
  final AddBranchModel addBranchModel;

  AddBranchEvent({required this.addBranchModel});
}
