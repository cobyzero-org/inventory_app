class UserModel {
  final int id;
  final String name;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? companyName;
  UserModel({
    required this.id,
    required this.name,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    this.companyName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    role: json['role'],
    createdAt: DateTime.parse(json['created_at']),
    updatedAt: DateTime.parse(json['updated_at']),
    companyName: json['company_name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'role': role,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'company_name': companyName,
  };
}
