import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/dashboard_entity.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
class DashboardModel with _$DashboardModel {
  const factory DashboardModel({
    required String role,
    required DashboardDataModel data,
  }) = _DashboardModel;

  const DashboardModel._();

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  DashboardEntity toEntity() {
    return DashboardEntity(
      role: role,
      data: data.toEntity(),
    );
  }

  @override
  // TODO: implement data
  DashboardDataModel get data => throw UnimplementedError();

  @override
  // TODO: implement role
  String get role => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

@freezed
class DashboardDataModel with _$DashboardDataModel {
  const factory DashboardDataModel({
    @JsonKey(name: 'total_contract_amount') required double totalContractAmount,
    @JsonKey(name: 'total_paid') required double totalPaid,
    @JsonKey(name: 'total_remaining') required double totalRemaining,
    @JsonKey(name: 'next_payment_amount') required double nextPaymentAmount,
    @JsonKey(name: 'next_payment_date') required String nextPaymentDate,
    @JsonKey(name: 'active_contracts') required int activeContracts,
  }) = _DashboardDataModel;

  const DashboardDataModel._();

  factory DashboardDataModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataModelFromJson(json);

  DashboardData toEntity() {
    return DashboardData(
      totalContractAmount: totalContractAmount,
      totalPaid: totalPaid,
      totalRemaining: totalRemaining,
      nextPaymentAmount: nextPaymentAmount,
      nextPaymentDate: nextPaymentDate,
      activeContracts: activeContracts,
    );
  }

  @override
  // TODO: implement activeContracts
  int get activeContracts => throw UnimplementedError();

  @override
  // TODO: implement nextPaymentAmount
  double get nextPaymentAmount => throw UnimplementedError();

  @override
  // TODO: implement nextPaymentDate
  String get nextPaymentDate => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement totalContractAmount
  double get totalContractAmount => throw UnimplementedError();

  @override
  // TODO: implement totalPaid
  double get totalPaid => throw UnimplementedError();

  @override
  // TODO: implement totalRemaining
  double get totalRemaining => throw UnimplementedError();
}
