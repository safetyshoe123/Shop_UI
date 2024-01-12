// import 'package:shop_ui/features/auth/domain/models/auth_restriction.model.dart';

import 'dart:convert';

class AuthModel {
  final int id;
  final String shopId;
  final String empId;
  final String lastName;
  final String firstName;
  final String middleName;
  // final String password;
  final List? restriction;
  // final Restriction restriction;
  final String status;
  final String dateHired;
  final String salary;
  final String notes;
  final String remark;
//TODO: Model for restriction and connect authModel and restrictionModel

  AuthModel({
    required this.id,
    required this.shopId,
    required this.empId,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    // required this.password,
    this.restriction,
    required this.status,
    required this.dateHired,
    required this.salary,
    required this.notes,
    required this.remark,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      shopId: json['shopId'],
      empId: json['empId'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      // password: json['password'],
      restriction: json['restriction'],
      // restriction: Restriction.fromJson(json['restriction']),
      status: json['status'],
      dateHired: json['dateHired'],
      salary: json['salary'],
      notes: json['notes'],
      remark: json['remark'],
    );
  }

  static Map<String, dynamic> toMap(AuthModel authModel) => <String, dynamic>{
        'id': authModel.id,
        'shopId': authModel.shopId,
        'empId': authModel.empId,
        'lastName': authModel.lastName,
        'firstName': authModel.firstName,
        'middleName': authModel.middleName,
        'restriction': authModel.restriction,
        'status': authModel.status,
        'dateHired': authModel.dateHired,
        'salary': authModel.salary,
        'notes': authModel.notes,
        'remark': authModel.remark,
      };

  static String serialize(AuthModel authModel) =>
      jsonEncode(AuthModel.toMap(authModel));

  static AuthModel deserialize(String json) =>
      AuthModel.fromJson(jsonDecode(json));
}
