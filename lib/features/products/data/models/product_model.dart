class ProductModel {
  final String id;
  final String name;
  final String year;
  final String details;
  final String price;
  final String status;
  final String? imageUrl;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.year,
    required this.details,
    required this.price,
    required this.status,
    this.imageUrl,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      year: json['year']?.toString() ?? '',
      details: json['details'] ?? '',
      price: json['price']?.toString() ?? '0',
      status: json['status'] ?? 'Active',
      imageUrl: json['image_url'],
      category: json['category'] ?? 'auto',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'details': details,
      'price': price,
      'status': status,
      'image_url': imageUrl,
      'category': category,
    };
  }
}
