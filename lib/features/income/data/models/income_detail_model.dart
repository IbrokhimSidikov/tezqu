import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/income_detail_entity.dart';

part 'income_detail_model.freezed.dart';
part 'income_detail_model.g.dart';

@freezed
class IncomeDetailModel with _$IncomeDetailModel {
  const factory IncomeDetailModel({
    @JsonKey(name: 'source_name') @Default('') String sourceName,
    @Default([]) List<PaymentDetailModel> payments,
  }) = _IncomeDetailModel;

  const IncomeDetailModel._();

  factory IncomeDetailModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeDetailModelFromJson(json);

  IncomeDetailEntity toEntity() {
    // Calculate totals from payments
    double totalAmount = 0.0;
    double totalPaid = 0.0;
    
    for (var payment in payments) {
      totalAmount += payment.amount;
      totalPaid += payment.amountPaid;
    }
    
    return IncomeDetailEntity(
      userName: sourceName,
      contracts: payments.map((payment) => payment.toEntity()).toList(),
      totalAmount: totalAmount,
      totalPaid: totalPaid,
    );
  }

  @override
  // TODO: implement sourceName
  String get sourceName => throw UnimplementedError();

  @override
  // TODO: implement payments
  List<PaymentDetailModel> get payments => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

@freezed
class PaymentDetailModel with _$PaymentDetailModel {
  const factory PaymentDetailModel({
    required String id,
    @JsonKey(name: 'contract_id') required String contractId,
    @JsonKey(name: 'customer_name') @Default('') String customerName,
    @JsonKey(name: 'product_name') @Default('') String productName,
    @JsonKey(name: 'payment_number') @Default(0) int paymentNumber,
    @JsonKey(name: 'due_date') String? dueDate,
    @Default(0.0) double amount,
    @JsonKey(name: 'amount_paid') @Default(0.0) double amountPaid,
    @JsonKey(name: 'amount_remaining') @Default(0.0) double amountRemaining,
    @Default('') String status,
    @JsonKey(name: 'currency_code') @Default('usd') String currencyCode,
    @JsonKey(name: 'currency_symbol') @Default('\$') String currencySymbol,
  }) = _PaymentDetailModel;

  const PaymentDetailModel._();

  factory PaymentDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailModelFromJson(json);

  ContractDetailEntity toEntity() {
    return ContractDetailEntity(
      id: id,
      productName: productName,
      productCategory: 'Card \$${amountPaid.toStringAsFixed(0)}',  // Using as subtitle
      amount: amount,
      status: status,
      dueDate: dueDate,
      productImage: null,
    );
  }

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement contractId
  String get contractId => throw UnimplementedError();

  @override
  // TODO: implement customerName
  String get customerName => throw UnimplementedError();

  @override
  // TODO: implement productName
  String get productName => throw UnimplementedError();

  @override
  // TODO: implement paymentNumber
  int get paymentNumber => throw UnimplementedError();

  @override
  // TODO: implement dueDate
  String? get dueDate => throw UnimplementedError();

  @override
  // TODO: implement amount
  double get amount => throw UnimplementedError();

  @override
  // TODO: implement amountPaid
  double get amountPaid => throw UnimplementedError();

  @override
  // TODO: implement amountRemaining
  double get amountRemaining => throw UnimplementedError();

  @override
  // TODO: implement status
  String get status => throw UnimplementedError();

  @override
  // TODO: implement currencyCode
  String get currencyCode => throw UnimplementedError();

  @override
  // TODO: implement currencySymbol
  String get currencySymbol => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
