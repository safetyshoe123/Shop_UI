class Restriction {
  final String branchId;

  Restriction({required this.branchId});

  factory Restriction.fromJson(Map<String, dynamic> json) {
    return Restriction(
      branchId: json['branchId'],
    );
  }
}
