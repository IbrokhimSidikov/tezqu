import 'package:injectable/injectable.dart';
import '../network/dio_client.dart';

@lazySingleton
class WishlistService {
  final DioClient _dioClient;

  WishlistService(this._dioClient);

  Future<void> addToWishlist(String productId) async {
    await _dioClient.post(
      '/wishlist',
      data: {
        'product_id': productId,
      },
    );
  }

  Future<void> removeFromWishlist(String productId) async {
    await _dioClient.delete(
      '/wishlist/$productId',
    );
  }

  Future<bool> isInWishlist(String productId) async {
    try {
      final response = await _dioClient.get('/wishlist/check/$productId');
      return response.data['inWishlist'] ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getWishlist() async {
    try {
      final response = await _dioClient.get('/wishlist');
      if (response.data is List) {
        // Extract the product data from each wishlist item
        return (response.data as List).map((item) {
          if (item is Map<String, dynamic> && item['product'] != null) {
            return item['product'] as Map<String, dynamic>;
          }
          return item as Map<String, dynamic>;
        }).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
