import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import '../../../../core/services/expense_service.dart';
import '../../data/models/expense_model.dart';
import '../../domain/repositories/expense_repository.dart';
import 'expense_state.dart';

@injectable
class ExpenseCubit extends Cubit<ExpenseState> {
  final ExpenseRepository _repository;
  final ExpenseService _expenseService;

  ExpenseCubit(this._repository, this._expenseService) : super(ExpenseInitial());

  Future<void> loadExpenseCategories() async {
    try {
      emit(ExpenseLoading());
      final categories = await _repository.getExpenseCategories();
      final currencies = await _repository.getCurrencies();
      final paymentMethods = await _repository.getPaymentMethods();
      
      emit(ExpenseCategoriesLoaded(
        categories,
        currencies: currencies,
        paymentMethods: paymentMethods,
      ));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  Future<void> loadExpensesForCategory(String categoryId) async {
    if (state is! ExpenseCategoriesLoaded) return;

    try {
      final currentState = state as ExpenseCategoriesLoaded;
      
      final now = DateTime.now();
      final startDate = DateTime(now.year, now.month, 1);
      final endDate = DateTime(now.year, now.month + 1, 0);
      
      final expenses = await _repository.getExpenses(
        category: categoryId,
        startDate: DateFormat('yyyy-MM-dd').format(startDate),
        endDate: DateFormat('yyyy-MM-dd').format(endDate),
        limit: 50,
      );

      final updatedExpenses = Map<String, List<ExpenseModel>>.from(currentState.expensesByCategory);
      updatedExpenses[categoryId] = expenses;

      emit(currentState.copyWith(expensesByCategory: updatedExpenses));
    } catch (e) {
      // Keep current state on error
    }
  }

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
    try {
      await _expenseService.createExpense(
        title: title,
        description: description,
        categoryId: categoryId,
        amount: amount,
        currencyId: currencyId,
        paymentMethodId: paymentMethodId,
        vendor: vendor,
        expenseDate: expenseDate,
        receiptUrl: receiptUrl,
      );
      
      await loadExpenseCategories();
    } catch (e) {
      rethrow;
    }
  }
}
