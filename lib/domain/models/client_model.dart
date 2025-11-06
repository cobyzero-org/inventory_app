class ClientModel {
  final int id;
  final String name;
  final String? address;
  final String? phone;
  final String? email;
  final DateTime createdAt;

  ClientModel({
    required this.id,
    required this.name,
    this.address,
    this.phone,
    this.email,
    required this.createdAt,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
    id: json['id'],
    name: json['name'],
    address: json['address'],
    phone: json['phone'],
    email: json['email'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'phone': phone,
    'email': email,
    'created_at': createdAt.toIso8601String(),
  };
}
