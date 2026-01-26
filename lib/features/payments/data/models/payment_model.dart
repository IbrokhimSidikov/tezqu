import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/payment_entity.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentsModel with _$PaymentsModel {
  const factory PaymentsModel({
    @JsonKey(name: 'next_payments') @Default([]) List<PaymentModel> nextPayments,
    @JsonKey(name: 'paid_payments') @Default([]) List<PaymentModel> paidPayments,
  }) = _PaymentsModel;

  const PaymentsModel._();

  factory PaymentsModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentsModelFromJson(json);

  PaymentsEntity toEntity() {
    return PaymentsEntity(
      nextPayments: nextPayments.map((payment) => payment.toEntity()).toList(),
      paidPayments: paidPayments.map((payment) => payment.toEntity()).toList(),
    );
  }

  @override
  // TODO: implement nextPayments
  List<PaymentModel> get nextPayments => throw UnimplementedError();

  @override
  // TODO: implement paidPayments
  List<PaymentModel> get paidPayments => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    @JsonKey(fromJson: _toInt) required int id,
    @JsonKey(name: 'product_name') @Default('') String productName,
    @JsonKey(name: 'due_date') @Default('') String dueDate,
    @JsonKey(fromJson: _toDouble) required double amount,
    @Default('') String status,
    @JsonKey(name: 'contract_id', fromJson: _toInt) required int contractId,
    @JsonKey(name: 'product_image') String? productImage,
    @JsonKey(name: 'product_category') String? productCategory,
    ContractModel? contract,
  }) = _PaymentModel;

  const PaymentModel._();

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  PaymentEntity toEntity() {
    return PaymentEntity(
      id: id,
      productName: productName,
      dueDate: dueDate,
      amount: amount,
      status: status,
      contractId: contractId,
      productImage: productImage,
      productCategory: productCategory,
      contract: contract?.toEntity(),
    );
  }

  @override
  // TODO: implement amount
  double get amount => throw UnimplementedError();

  @override
  // TODO: implement contractId
  int get contractId => throw UnimplementedError();

  @override
  // TODO: implement dueDate
  String get dueDate => throw UnimplementedError();

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement productCategory
  String? get productCategory => throw UnimplementedError();

  @override
  // TODO: implement productImage
  String? get productImage => throw UnimplementedError();

  @override
  // TODO: implement productName
  String get productName => throw UnimplementedError();

  @override
  // TODO: implement status
  String get status => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement contract
  ContractModel? get contract => throw UnimplementedError();
}

// Helper functions to convert String to num types
int _toInt(dynamic value) {
  if (value is int) return value;
  if (value is String) {
    if (value.isEmpty) return 0;
    return int.tryParse(value) ?? 0;
  }
  if (value == null) return 0;
  return 0;
}

double _toDouble(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) {
    if (value.isEmpty) return 0.0;
    return double.tryParse(value) ?? 0.0;
  }
  if (value == null) return 0.0;
  return 0.0;
}

@freezed
class ContractModel with _$ContractModel {
  const factory ContractModel({
    @JsonKey(fromJson: _toInt) required int id,
    ProductModel? product,
    @JsonKey(name: 'service_contract_pdf') String? serviceContractPdf,
  }) = _ContractModel;

  const ContractModel._();

  factory ContractModel.fromJson(Map<String, dynamic> json) =>
      _$ContractModelFromJson(json);

  ContractEntity toEntity() {
    return ContractEntity(
      id: id,
      product: product?.toEntity(),
      serviceContractPdf: serviceContractPdf,
    );
  }

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement product
  ProductModel? get product => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement serviceContractPdf
  String? get serviceContractPdf => throw UnimplementedError();
}

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @Default('') String name,
    @JsonKey(name: 'custom_fields') @Default({}) Map<String, dynamic> customFields,
  }) = _ProductModel;

  const ProductModel._();

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      customFields: customFields,
    );
  }

  @override
  // TODO: implement customFields
  Map<String, dynamic> get customFields => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
