import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../models/collectable_model.dart';

abstract class CollectableRemoteDataSource {
  Future<CollectablesModel> getCollectables();
  Future<CollectableContractModel> getContractDetails(String contractId);
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
}
