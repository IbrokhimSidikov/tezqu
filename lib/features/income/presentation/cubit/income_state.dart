import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/income_entity.dart';
import '../../domain/entities/income_detail_entity.dart';

part 'income_state.freezed.dart';

@freezed
class IncomeState with _$IncomeState {
  const factory IncomeState.initial() = _Initial;
  const factory IncomeState.loading() = _Loading;
  const factory IncomeState.loaded(IncomeSourcesEntity incomeSources) = _Loaded;
  const factory IncomeState.error(String message) = _Error;
  const factory IncomeState.detailLoading() = _DetailLoading;
  const factory IncomeState.detailLoaded(IncomeDetailEntity incomeDetail) = _DetailLoaded;
  const factory IncomeState.detailError(String message) = _DetailError;
}
