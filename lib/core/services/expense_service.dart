import 'package:injectable/injectable.dart';
import '../network/dio_client.dart';

@lazySingleton
class ExpenseService {
  final DioClient _dioClient;

  ExpenseService(this._dioClient);

  Future<void> createExpense({
    required String title,
    required String description,
    required String categoryId,
    required double amount,
    required String currencyId,
    required String paymentMethodId,
    required String vendor,
    required String expenseDate,
    String? receiptUrl,
  }) async {
    await _dioClient.post(
      '/expenses',
      data: {
        'title': title,
        'description': description,
        'category_id': categoryId,
        'amount': amount,
        'currency_id': currencyId,
        'payment_method_id': paymentMethodId,
        'vendor': vendor,
        'expense_date': expenseDate,
        if (receiptUrl != null) 'receipt_url': receiptUrl,
      },
    );
  }
}
