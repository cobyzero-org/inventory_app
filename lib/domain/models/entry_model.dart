import 'package:inventory_app/domain/models/client_model.dart';
import 'package:inventory_app/domain/models/product_model.dart';

class EntryModel {
  final int id;
  final int productId;
  final ProductModel? product;
  final int? userId;

  final int clientId;
  final ClientModel? client;
  final int quantity;
  final DateTime date;
  final String? note;

  EntryModel({
    required this.id,
    required this.productId,
    this.product,
    this.userId,
    required this.clientId,
    this.client,
    required this.quantity,
    required this.date,
    this.note,
  });

  factory EntryModel.fromJson(
    Map<String, dynamic> json,
    ProductModel? product,
    ClientModel? client,
  ) => EntryModel(
    id: json['id'],
    productId: json['product_id'],
    userId: json['user_id'],
    clientId: json['client_id'],
    quantity: json['quantity'],
    date: DateTime.parse(json['date']),
    note: json['note'],
    product: product,
    client: client,
  );

  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'client_id': clientId,
    'user_id': userId,
    'quantity': quantity,
    'date': date.toIso8601String(),
    'note': note,
  };

  EntryModel copyWith({
    int? productId,
    int? id,
    ProductModel? product,
    int? userId,
    int? quantity,
    DateTime? date,
    int? clientId,
    ClientModel? client,
    String? note,
  }) => EntryModel(
    id: id ?? this.id,
    productId: productId ?? this.productId,
    product: product ?? this.product,
    userId: userId ?? this.userId,
    clientId: clientId ?? this.clientId,
    client: client ?? this.client,
    quantity: quantity ?? this.quantity,
    date: date ?? this.date,
    note: note ?? this.note,
  );
}
