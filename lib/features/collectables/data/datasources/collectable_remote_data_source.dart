import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../models/balance_model.dart';
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
  Future<void> delayPayment({
    required String paymentId,
    required String delayUntil,
    required String delayReason,
  });
  Future<UserBalanceModel> getUserBalanceDetails(String userId);
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
      debugPrint('[CollectableDS] recordPayment → POST /payments/record'
          ' | paymentId=$paymentId amount=$amount'
          ' paymentMethodId=$paymentMethodId paymentDate=$paymentDate');
      final response = await dioClient.post('/payments/record', data: {
        'payment_id': paymentId,
        'amount': amount,
        'payment_method_id': paymentMethodId,
        'payment_date': paymentDate,
      });
      debugPrint('[CollectableDS] recordPayment ✓ status=${response.statusCode}'
          ' | body=${response.data}');
    } catch (e) {
      debugPrint('[CollectableDS] recordPayment ✗ error=$e');
      rethrow;
    }
  }

  @override
  Future<void> delayPayment({
    required String paymentId,
    required String delayUntil,
    required String delayReason,
  }) async {
    try {
      debugPrint('[CollectableDS] delayPayment → POST /payments/$paymentId/delay'
          ' | delayUntil=$delayUntil delayReason=$delayReason');
      final response = await dioClient.post('/payments/$paymentId/delay', data: {
        'delay_until': delayUntil,
        'delay_reason': delayReason,
      });
      debugPrint('[CollectableDS] delayPayment ✓ status=${response.statusCode}'
          ' | body=${response.data}');
    } catch (e) {
      debugPrint('[CollectableDS] delayPayment ✗ error=$e');
      rethrow;
    }
  }

  @override
  Future<UserBalanceModel> getUserBalanceDetails(String userId) async {
    try {
      final response = await dioClient.get('/users/$userId/balance-details');
      return UserBalanceModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
