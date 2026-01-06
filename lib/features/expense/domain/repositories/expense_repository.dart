import '../../data/models/currency_model.dart';
import '../../data/models/expense_category_model.dart';
import '../../data/models/expense_model.dart';
import '../../data/models/payment_method_model.dart';

abstract class ExpenseRepository {
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
