import 'package:injectable/injectable.dart';
import '../../../../core/network/dio_client.dart';
import '../models/currency_model.dart';
import '../models/expense_category_model.dart';
import '../models/expense_model.dart';
import '../models/payment_method_model.dart';

abstract class ExpenseRemoteDataSource {
  Future<List<ExpenseCategoryModel>> getExpenseCategories();
  Future<List<CurrencyModel>> getCurrencies();
  Future<List<PaymentMethodModel>> getPaymentMethods();
  Future<List<ExpenseModel>> getExpenses({
    String? status,
    String? categoryId,
    required String category,
    required String startDate,
    required String endDate,
    int? limit,
    int? page,
  });
}

@LazySingleton(as: ExpenseRemoteDataSource)
class ExpenseRemoteDataSourceImpl implements ExpenseRemoteDataSource {
  final DioClient _dioClient;

  ExpenseRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<ExpenseCategoryModel>> getExpenseCategories() async {
    final response = await _dioClient.get('/expense-categories');
    
    final List<dynamic> data = response.data is List 
        ? response.data 
        : response.data['data'] ?? [];
    
    return data
        .map((json) => ExpenseCategoryModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    final response = await _dioClient.get('/currencies');
    
    final List<dynamic> data = response.data is List 
        ? response.data 
        : response.data['data'] ?? [];
    
    return data
        .map((json) => CurrencyModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    final response = await _dioClient.get('/payment-types');
    
    final List<dynamic> data = response.data is List 
        ? response.data 
        : response.data['data'] ?? [];
    
    return data
        .map((json) => PaymentMethodModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<ExpenseModel>> getExpenses({
    String? status,
    String? categoryId,
    required String category,
    required String startDate,
    required String endDate,
    int? limit,
    int? page,
  }) async {
    final queryParameters = <String, dynamic>{
      'category': category,
      'startDate': startDate,
      'endDate': endDate,
      if (status != null) 'status': status,
      if (categoryId != null) 'category_id': categoryId,
      if (limit != null) 'limit': limit,
      if (page != null) 'page': page,
    };

    final response = await _dioClient.get(
      '/expenses',
      queryParameters: queryParameters,
    );
    
    final List<dynamic> data = response.data is List 
        ? response.data 
        : response.data['data'] ?? [];
    
    return data
        .map((json) => ExpenseModel.fromJson(json))
        .toList();
  }
}
