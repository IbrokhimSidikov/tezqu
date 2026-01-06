class ExpenseCategoryModel {
  final String id;
  final String code;
  final String name;
  final String description;
  final String icon;
  final String color;
  final bool isActive;
  final int displayOrder;
  final String createdAt;
  final String updatedAt;

  ExpenseCategoryModel({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.isActive,
    required this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExpenseCategoryModel.fromJson(Map<String, dynamic> json) {
    return ExpenseCategoryModel(
      id: json['id'] ?? '',
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
      color: json['color'] ?? '#000000',
      isActive: json['is_active'] ?? true,
      displayOrder: json['display_order'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'description': description,
      'icon': icon,
      'color': color,
      'is_active': isActive,
      'display_order': displayOrder,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
