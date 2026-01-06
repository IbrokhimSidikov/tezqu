import 'package:injectable/injectable.dart';
import '../../domain/repositories/expense_repository.dart';
import '../datasources/expense_remote_data_source.dart';
import '../models/currency_model.dart';
import '../models/expense_category_model.dart';
import '../models/expense_model.dart';
import '../models/payment_method_model.dart';

@LazySingleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseRemoteDataSource _remoteDataSource;

  ExpenseRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<ExpenseCategoryModel>> getExpenseCategories() async {
    return await _remoteDataSource.getExpenseCategories();
  }

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    return await _remoteDataSource.getCurrencies();
  }

  @override
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    return await _remoteDataSource.getPaymentMethods();
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
    return await _remoteDataSource.getExpenses(
      status: status,
      categoryId: categoryId,
      category: category,
      startDate: startDate,
      endDate: endDate,
      limit: limit,
      page: page,
    );
  }
}
