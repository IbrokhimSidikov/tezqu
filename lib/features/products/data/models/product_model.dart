class ProductModel {
  final String id;
  final String name;
  final String year;
  final String details;
  final String price;
  final String status;
  final List<String> imageUrls;
  final String category;
  final Map<String, dynamic>? customFields;

  ProductModel({
    required this.id,
    required this.name,
    required this.year,
    required this.details,
    required this.price,
    required this.status,
    required this.imageUrls,
    required this.category,
    this.customFields,
  });

  // Helper getter for backward compatibility
  String? get imageUrl => imageUrls.isNotEmpty ? imageUrls.first : null;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // Extract year from custom_fields if available
    final customFields = json['custom_fields'] as Map<String, dynamic>?;
    String year = '';
    
    if (customFields != null) {
      // Try different possible year field names
      year = customFields['Yili']?.toString() ?? 
             customFields['Yil']?.toString() ?? 
             customFields['year']?.toString() ?? '';
    }
    
    // Parse image_urls or image_ids array
    List<String> imageUrls = [];
    
    // First check for image_urls (direct URLs)
    if (json['image_urls'] != null && json['image_urls'] is List) {
      imageUrls = (json['image_urls'] as List)
          .map((url) => url.toString())
          .toList();
    } 
    // If not found, check for image_ids and convert to URLs
    else if (json['image_ids'] != null && json['image_ids'] is List) {
      const baseUrl = 'https://api.tezqu.uz';
      imageUrls = (json['image_ids'] as List)
          .map((id) => '$baseUrl/images/$id')
          .toList();
    }
    
    return ProductModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      year: year,
      details: json['description'] ?? '',
      price: json['price']?.toString() ?? '0',
      status: json['status'] ?? 'available',
      imageUrls: imageUrls,
      category: json['category_id'] ?? '',
      customFields: customFields,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'description': details,
      'price': price,
      'status': status,
      'image_urls': imageUrls,
      'category_id': category,
      'custom_fields': customFields,
    };
  }
}
