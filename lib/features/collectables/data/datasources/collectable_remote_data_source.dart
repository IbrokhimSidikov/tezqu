import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../models/collectable_model.dart';

abstract class CollectableRemoteDataSource {
  Future<CollectablesModel> getCollectables();
  Future<CollectableContractModel> getContractDetails(String contractId);
  Future<void> recordPayment({
    required String paymentId,
    required double amount,
    required String paymentMethodId,
    required String paymentDate,
  });
}

@LazySingleton(as: CollectableRemoteDataSource)
class CollectableRemoteDataSourceImpl implements CollectableRemoteDataSource {
  final DioClient dioClient;

  CollectableRemoteDataSourceImpl(this.dioClient);

  @override
  Future<CollectablesModel> getCollectables() async {
    try {
      final response = await dioClient.get('/contracts');
      return CollectablesModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CollectableContractModel> getContractDetails(String contractId) async {
    try {
      final response = await dioClient.get('/contracts/$contractId');
      return CollectableContractModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> recordPayment({
    required String paymentId,
    required double amount,
    required String paymentMethodId,
    required String paymentDate,
  }) async {
    try {
      await dioClient.post('/payments/record', data: {
        'payment_id': paymentId,
        'amount': amount,
        'payment_method_id': paymentMethodId,
        'payment_date': paymentDate,
      });
    } catch (e) {
      rethrow;
    }
  }
}
