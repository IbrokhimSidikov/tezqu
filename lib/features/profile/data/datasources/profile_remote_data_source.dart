import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';

abstract class ProfileRemoteDataSource {
  Future<void> deleteAccount(String userId);
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioClient dioClient;

  ProfileRemoteDataSourceImpl(this.dioClient);

  @override
  Future<void> deleteAccount(String userId) async {
    await dioClient.delete('/users/$userId');
  }
}
