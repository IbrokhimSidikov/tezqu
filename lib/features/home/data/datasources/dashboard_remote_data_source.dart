import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../models/dashboard_model.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardModel> getDashboard();
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final DioClient dioClient;

  DashboardRemoteDataSourceImpl(this.dioClient);

  @override
  Future<DashboardModel> getDashboard() async {
    final response = await dioClient.get('/dashboard');
    return DashboardModel.fromJson(response.data);
  }
}
