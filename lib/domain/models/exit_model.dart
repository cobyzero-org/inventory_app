import 'package:inventory_app/domain/models/client_model.dart';
import 'package:inventory_app/domain/models/product_model.dart';

class ExitModel {
  final int id;
  final int productId;
  final ProductModel? product;
  final int? clientId;
  final ClientModel? client;
  final int? userId;
  final int quantity;
  final DateTime date;
  final String? note;

  ExitModel({
    required this.id,
    required this.productId,
    this.product,
    this.clientId,
    this.client,
    this.userId,
    required this.quantity,
    required this.date,
    this.note,
  });

  factory ExitModel.fromJson(
    Map<String, dynamic> json, {
    ClientModel? client,
    ProductModel? product,
  }) => ExitModel(
    id: json['id'],
    productId: json['product_id'],
    product: product,
    clientId: json['client_id'],
    client: client,
    userId: json['user_id'],
    quantity: json['quantity'],
    date: DateTime.parse(json['date']),
    note: json['note'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'product_id': productId,
    'client_id': clientId,
    'user_id': userId,
    'quantity': quantity,
    'date': date.toIso8601String(),
    'note': note,
  };
}
