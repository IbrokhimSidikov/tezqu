import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../models/payment_model.dart';

abstract class PaymentRemoteDataSource {
  Future<PaymentsModel> getPayments();
}

@LazySingleton(as: PaymentRemoteDataSource)
class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final DioClient _dioClient;

  PaymentRemoteDataSourceImpl(this._dioClient);

  @override
  Future<PaymentsModel> getPayments() async {
    final response = await _dioClient.get('/payments/my-payments');
    return PaymentsModel.fromJson(response.data);
  }
}
