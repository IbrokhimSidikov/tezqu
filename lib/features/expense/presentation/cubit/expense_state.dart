import 'package:equatable/equatable.dart';
import '../../data/models/currency_model.dart';
import '../../data/models/expense_category_model.dart';
import '../../data/models/expense_model.dart';
import '../../data/models/payment_method_model.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object?> get props => [];
}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseCategoriesLoaded extends ExpenseState {
  final List<ExpenseCategoryModel> categories;
  final List<CurrencyModel> currencies;
  final List<PaymentMethodModel> paymentMethods;
  final Map<String, List<ExpenseModel>> expensesByCategory;

  const ExpenseCategoriesLoaded(
    this.categories, {
    this.currencies = const [],
    this.paymentMethods = const [],
    this.expensesByCategory = const {},
  });

  @override
  List<Object?> get props => [categories, currencies, paymentMethods, expensesByCategory];

  ExpenseCategoriesLoaded copyWith({
    List<ExpenseCategoryModel>? categories,
    List<CurrencyModel>? currencies,
    List<PaymentMethodModel>? paymentMethods,
    Map<String, List<ExpenseModel>>? expensesByCategory,
  }) {
    return ExpenseCategoriesLoaded(
      categories ?? this.categories,
      currencies: currencies ?? this.currencies,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      expensesByCategory: expensesByCategory ?? this.expensesByCategory,
    );
  }
}

class ExpenseError extends ExpenseState {
  final String message;

  const ExpenseError(this.message);

  @override
  List<Object?> get props => [message];
}
