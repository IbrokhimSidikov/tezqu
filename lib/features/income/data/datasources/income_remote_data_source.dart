import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../models/income_model.dart';
import '../models/income_detail_model.dart';

abstract class IncomeRemoteDataSource {
  Future<IncomeSourcesModel> getIncomeSources({
    required int year,
    required int month,
  });

  Future<IncomeDetailModel> getIncomeDetail({
    required String sourceType,
    required String userId,
    required int year,
    required int month,
  });
}

@LazySingleton(as: IncomeRemoteDataSource)
class IncomeRemoteDataSourceImpl implements IncomeRemoteDataSource {
  final DioClient _dioClient;

  IncomeRemoteDataSourceImpl(this._dioClient);

  @override
  Future<IncomeSourcesModel> getIncomeSources({
    required int year,
    required int month,
  }) async {
    final response = await _dioClient.get(
      '/payments/income/sources',
      queryParameters: {
        'year': year,
        'month': month,
      },
    );
    return IncomeSourcesModel.fromJson(response.data);
  }

  @override
  Future<IncomeDetailModel> getIncomeDetail({
    required String sourceType,
    required String userId,
    required int year,
    required int month,
  }) async {
    final response = await _dioClient.get(
      '/payments/income/$sourceType/$userId',
      queryParameters: {
        'year': year,
        'month': month,
      },
    );
    return IncomeDetailModel.fromJson(response.data);
  }
}
