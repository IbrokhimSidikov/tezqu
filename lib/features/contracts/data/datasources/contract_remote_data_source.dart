import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../models/contract_model.dart';

abstract class ContractRemoteDataSource {
  Future<ContractsModel> getContracts();
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
}
