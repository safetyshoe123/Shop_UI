class RegisterModel {
  final String shopId;
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

  RegisterModel({
    required this.shopId,
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
}
