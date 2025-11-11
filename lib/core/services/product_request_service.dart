import 'package:injectable/injectable.dart';
import '../network/dio_client.dart';

@lazySingleton
class ProductRequestService {
  final DioClient _dioClient;

  ProductRequestService(this._dioClient);

  Future<void> createProductRequest(String productId) async {
    await _dioClient.post(
      '/products/requests',
      data: {
        'product_id': productId,
      },
    );
  }
}
