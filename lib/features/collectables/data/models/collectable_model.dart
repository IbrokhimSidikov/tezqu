import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/collectable_entity.dart';

part 'collectable_model.freezed.dart';
part 'collectable_model.g.dart';

@freezed
class CollectablesModel with _$CollectablesModel {
  const factory CollectablesModel({
    @Default([]) List<CollectableContractModel> contracts,
  }) = _CollectablesModel;

  const CollectablesModel._();

  factory CollectablesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && json['data'] is List) {
      final List<dynamic> data = json['data'];
      final contracts = data
          .map((item) => CollectableContractModel.fromJson(item))
          .toList();
      return CollectablesModel(contracts: contracts);
    }
    return const CollectablesModel();
  }

  CollectablesEntity toEntity() {
    return CollectablesEntity(
      contracts: contracts.map((contract) => contract.toEntity()).toList(),
    );
  }

  @override
  // TODO: implement contracts
  List<CollectableContractModel> get contracts => throw UnimplementedError();
}

@freezed
class CollectableContractModel with _$CollectableContractModel {
  const factory CollectableContractModel({
    required String id,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'approved_by_admin') String? approvedByAdmin,
    @JsonKey(name: 'contract_type') required String contractType,
    @JsonKey(name: 'collector_id') String? collectorId,
    @JsonKey(name: 'payment_type') required String paymentType,
    @Default([]) List<CollectablePaymentModel> payments,
    UserInfoModel? user,
    ProductInfoModel? product,
    CollectorInfoModel? collector,
  }) = _CollectableContractModel;

  const CollectableContractModel._();

  factory CollectableContractModel.fromJson(Map<String, dynamic> json) =>
      _$CollectableContractModelFromJson(json);

  CollectableContractEntity toEntity() {
    return CollectableContractEntity(
      id: id,
      productId: productId,
      userId: userId,
      approvedByAdmin: approvedByAdmin,
      contractType: contractType,
      collectorId: collectorId,
      paymentType: paymentType,
      payments: payments.map((payment) => payment.toEntity()).toList(),
      user: user?.toEntity(),
      product: product?.toEntity(),
      collector: collector?.toEntity(),
    );
  }

  @override
  // TODO: implement approvedByAdmin
  String? get approvedByAdmin => throw UnimplementedError();

  @override
  // TODO: implement collectorId
  String? get collectorId => throw UnimplementedError();

  @override
  // TODO: implement contractType
  String get contractType => throw UnimplementedError();

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement paymentType
  String get paymentType => throw UnimplementedError();

  @override
  // TODO: implement payments
  List<CollectablePaymentModel> get payments => throw UnimplementedError();

  @override
  // TODO: implement product
  ProductInfoModel? get product => throw UnimplementedError();

  @override
  // TODO: implement productId
  String get productId => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  UserInfoModel? get user => throw UnimplementedError();

  @override
  // TODO: implement userId
  String get userId => throw UnimplementedError();

  @override
  // TODO: implement collector
  CollectorInfoModel? get collector => throw UnimplementedError();
}

@freezed
class CollectablePaymentModel with _$CollectablePaymentModel {
  const factory CollectablePaymentModel({
    required String id,
    @JsonKey(name: 'contract_id') required String contractId,
    @JsonKey(name: 'currency_id') required String currencyId,
    @JsonKey(name: 'collector_id') String? collectorId,
    @JsonKey(name: 'payment_number') required int paymentNumber,
    @JsonKey(name: 'due_date') required String dueDate,
    @JsonKey(fromJson: _toDouble) required double amount,
    @JsonKey(name: 'amount_paid', fromJson: _toDouble) required double amountPaid,
    @JsonKey(name: 'amount_remaining', fromJson: _toDouble) required double amountRemaining,
    required String status,
    @JsonKey(name: 'paid_date') String? paidDate,
    @JsonKey(name: 'payment_method_id') String? paymentMethodId,
    @JsonKey(name: 'days_overdue') @Default(0) int daysOverdue,
    @JsonKey(name: 'reminder_sent') @Default(false) bool reminderSent,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _CollectablePaymentModel;

  const CollectablePaymentModel._();

  factory CollectablePaymentModel.fromJson(Map<String, dynamic> json) =>
      _$CollectablePaymentModelFromJson(json);

  CollectablePaymentEntity toEntity() {
    return CollectablePaymentEntity(
      id: id,
      contractId: contractId,
      currencyId: currencyId,
      collectorId: collectorId,
      paymentNumber: paymentNumber,
      dueDate: dueDate,
      amount: amount,
      amountPaid: amountPaid,
      amountRemaining: amountRemaining,
      status: status,
      paidDate: paidDate,
      paymentMethodId: paymentMethodId,
      daysOverdue: daysOverdue,
      reminderSent: reminderSent,
      createdAt: createdAt,
    );
  }

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
  // TODO: implement collectorId
  String? get collectorId => throw UnimplementedError();

  @override
  // TODO: implement contractId
  String get contractId => throw UnimplementedError();

  @override
  // TODO: implement createdAt
  String get createdAt => throw UnimplementedError();

  @override
  // TODO: implement currencyId
  String get currencyId => throw UnimplementedError();

  @override
  // TODO: implement daysOverdue
  int get daysOverdue => throw UnimplementedError();

  @override
  // TODO: implement dueDate
  String get dueDate => throw UnimplementedError();

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement paidDate
  String? get paidDate => throw UnimplementedError();

  @override
  // TODO: implement paymentMethodId
  String? get paymentMethodId => throw UnimplementedError();

  @override
  // TODO: implement paymentNumber
  int get paymentNumber => throw UnimplementedError();

  @override
  // TODO: implement reminderSent
  bool get reminderSent => throw UnimplementedError();

  @override
  // TODO: implement status
  String get status => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

@freezed
class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
  }) = _UserInfoModel;

  const UserInfoModel._();

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  UserInfoEntity toEntity() {
    return UserInfoEntity(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );
  }

  @override
  // TODO: implement firstName
  String? get firstName => throw UnimplementedError();

  @override
  // TODO: implement lastName
  String? get lastName => throw UnimplementedError();

  @override
  // TODO: implement phoneNumber
  String? get phoneNumber => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

@freezed
class ProductInfoModel with _$ProductInfoModel {
  const factory ProductInfoModel({
    String? name,
    String? category,
    @JsonKey(name: 'image_urls') List<String>? imageUrls,
  }) = _ProductInfoModel;

  const ProductInfoModel._();

  factory ProductInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoModelFromJson(json);

  ProductInfoEntity toEntity() {
    return ProductInfoEntity(
      name: name,
      category: category,
      imageUrls: imageUrls,
    );
  }

  @override
  // TODO: implement category
  String? get category => throw UnimplementedError();

  @override
  // TODO: implement imageUrls
  List<String>? get imageUrls => throw UnimplementedError();

  @override
  // TODO: implement name
  String? get name => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

@freezed
class CollectorInfoModel with _$CollectorInfoModel {
  const factory CollectorInfoModel({
    String? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    String? role,
  }) = _CollectorInfoModel;

  const CollectorInfoModel._();

  factory CollectorInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CollectorInfoModelFromJson(json);

  CollectorInfoEntity toEntity() {
    return CollectorInfoEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      role: role,
    );
  }

  @override
  // TODO: implement firstName
  String? get firstName => throw UnimplementedError();

  @override
  // TODO: implement id
  String? get id => throw UnimplementedError();

  @override
  // TODO: implement lastName
  String? get lastName => throw UnimplementedError();

  @override
  // TODO: implement phoneNumber
  String? get phoneNumber => throw UnimplementedError();

  @override
  // TODO: implement role
  String? get role => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
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
