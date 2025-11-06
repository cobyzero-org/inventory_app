class ReportModel {
  final int id;
  final String type;
  final String? description;
  final int? generatedBy;
  final DateTime date;
  final Map<String, dynamic>? data;

  ReportModel({
    required this.id,
    required this.type,
    this.description,
    this.generatedBy,
    required this.date,
    this.data,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
    id: json['id'],
    type: json['type'],
    description: json['description'],
    generatedBy: json['generated_by'],
    date: DateTime.parse(json['date']),
    data: json['data'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'description': description,
    'generated_by': generatedBy,
    'date': date.toIso8601String(),
    'data': data,
  };
}
