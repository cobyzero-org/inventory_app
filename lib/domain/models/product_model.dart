import 'package:inventory_app/domain/models/category_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String? description;
  final int? categoryId;
  final CategoryModel? category;
  final int stock;
  final double unitPrice;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    this.categoryId,
    this.category,
    required this.stock,
    required this.unitPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(
    Map<String, dynamic> json, {
    CategoryModel? category,
  }) => ProductModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    categoryId: json['category_id'],
    category: category,
    stock: json['stock'],
    unitPrice: (json['unit_price'] as num).toDouble(),
    createdAt: DateTime.parse(json['created_at']),
    updatedAt: DateTime.parse(json['updated_at']),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'category_id': categoryId,
    'stock': stock,
    'unit_price': unitPrice,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
  };
}
