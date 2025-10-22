import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/income_entity.dart';

part 'income_model.freezed.dart';
part 'income_model.g.dart';

@freezed
class IncomeSourcesModel with _$IncomeSourcesModel {
  const factory IncomeSourcesModel({
    @Default([]) List<IncomeSourceModel> collectors,
    @Default([]) List<IncomeSourceModel> customers,
    @Default([]) List<IncomeSourceModel> investors,
    String? month,
  }) = _IncomeSourcesModel;

  const IncomeSourcesModel._();

  factory IncomeSourcesModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeSourcesModelFromJson(json);

  IncomeSourcesEntity toEntity() {
    return IncomeSourcesEntity(
      collectors: collectors.map((source) => source.toEntity()).toList(),
      clients: customers.map((source) => source.toEntity()).toList(),
      investors: investors.map((source) => source.toEntity()).toList(),
    );
  }

  @override
  // TODO: implement collectors
  List<IncomeSourceModel> get collectors => throw UnimplementedError();

  @override
  // TODO: implement customers
  List<IncomeSourceModel> get customers => throw UnimplementedError();

  @override
  // TODO: implement investors
  List<IncomeSourceModel> get investors => throw UnimplementedError();

  @override
  // TODO: implement month
  String? get month => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

@freezed
class IncomeSourceModel with _$IncomeSourceModel {
  const factory IncomeSourceModel({
    @JsonKey(name: 'source_type') String? sourceType,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'full_name') @Default('') String fullName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'monthly_total') @Default(0.0) double monthlyTotal,
    @JsonKey(name: 'pending_count') @Default(0) int pendingCount,
  }) = _IncomeSourceModel;

  const IncomeSourceModel._();

  factory IncomeSourceModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeSourceModelFromJson(json);

  IncomeSourceEntity toEntity() {
    return IncomeSourceEntity(
      id: userId ?? '',
      name: fullName,
      amount: monthlyTotal,
      status: pendingCount > 0 ? 'Jarayonda' : 'To\'liq',
      image: null,
    );
  }

  @override
  // TODO: implement sourceType
  String? get sourceType => throw UnimplementedError();

  @override
  // TODO: implement userId
  String? get userId => throw UnimplementedError();

  @override
  // TODO: implement fullName
  String get fullName => throw UnimplementedError();

  @override
  // TODO: implement phoneNumber
  String? get phoneNumber => throw UnimplementedError();

  @override
  // TODO: implement monthlyTotal
  double get monthlyTotal => throw UnimplementedError();

  @override
  // TODO: implement pendingCount
  int get pendingCount => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
