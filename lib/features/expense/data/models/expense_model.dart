class ExpenseModel {
  final String id;
  final String title;
  final String description;
  final String categoryId;
  final double amount;
  final String currencyId;
  final String paymentMethodId;
  final String vendor;
  final String expenseDate;
  final String? receiptUrl;
  final String status;
  final String createdAt;
  final String updatedAt;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.amount,
    required this.currencyId,
    required this.paymentMethodId,
    required this.vendor,
    required this.expenseDate,
    this.receiptUrl,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      categoryId: json['category_id'] ?? '',
      amount: double.tryParse(json['amount']?.toString() ?? '0') ?? 0.0,
      currencyId: json['currency_id'] ?? '',
      paymentMethodId: json['payment_method_id'] ?? '',
      vendor: json['vendor'] ?? '',
      expenseDate: json['expense_date'] ?? '',
      receiptUrl: json['receipt_url'],
      status: json['status'] ?? 'pending',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category_id': categoryId,
      'amount': amount,
      'currency_id': currencyId,
      'payment_method_id': paymentMethodId,
      'vendor': vendor,
      'expense_date': expenseDate,
      if (receiptUrl != null) 'receipt_url': receiptUrl,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
