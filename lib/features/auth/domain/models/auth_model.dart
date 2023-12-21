class AuthModel {
  final int id;
  final String branchId;
  final String empId;
  final String lastName;
  final String firstName;
  final String middleName;
  final String password;
  final String status;
  final DateTime dateHired;
  final double salary;
  final String notes;
  final String remark;

  AuthModel({
    required this.id,
    required this.branchId,
    required this.empId,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.password,
    required this.status,
    required this.dateHired,
    required this.salary,
    required this.notes,
    required this.remark,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'] as int,
      branchId: json['branchId'] as String,
      empId: json['empId'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      password: json['password'] as String,
      status: json['status'] as String,
      dateHired: json['dateHired'] as DateTime,
      salary: json['salary'] as double,
      notes: json['notes'] as String,
      remark: json['remark'] as String,
    );
  }
  factory AuthModel.fromMap(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'] as int,
      branchId: json['branchId'] as String,
      empId: json['empId'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      password: json['password'] as String,
      status: json['status'] as String,
      dateHired: json['dateHired'] as DateTime,
      salary: json['salary'] as double,
      notes: json['notes'] as String,
      remark: json['remark'] as String,
    );
  }
}
