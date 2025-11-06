class EntryModel {
  final int id;
  final int productId;
  final int? userId;
  final int quantity;
  final DateTime date;
  final String? note;

  EntryModel({
    required this.id,
    required this.productId,
    this.userId,
    required this.quantity,
    required this.date,
    this.note,
  });

  factory EntryModel.fromJson(Map<String, dynamic> json) => EntryModel(
    id: json['id'],
    productId: json['product_id'],
    userId: json['user_id'],
    quantity: json['quantity'],
    date: DateTime.parse(json['date']),
    note: json['note'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'product_id': productId,
    'user_id': userId,
    'quantity': quantity,
    'date': date.toIso8601String(),
    'note': note,
  };
}
