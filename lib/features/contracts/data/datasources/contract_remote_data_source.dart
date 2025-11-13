import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../models/contract_model.dart';

abstract class ContractRemoteDataSource {
  Future<ContractsModel> getContracts();
  Future<void> acceptContract(String contractId);
  Future<void> rejectContract(String contractId);
}

@LazySingleton(as: ContractRemoteDataSource)
class ContractRemoteDataSourceImpl implements ContractRemoteDataSource {
  final DioClient dioClient;

  ContractRemoteDataSourceImpl(this.dioClient);

  @override
  Future<ContractsModel> getContracts() async {
    try {
      final response = await dioClient.get('/contracts/my-contracts');
      return ContractsModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> acceptContract(String contractId) async {
    try {
      await dioClient.patch('/contracts/$contractId/accept');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> rejectContract(String contractId) async {
    try {
      await dioClient.patch('/contracts/$contractId/cancel');
    } catch (e) {
      rethrow;
    }
  }
}
