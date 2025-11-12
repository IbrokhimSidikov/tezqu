import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/contract_entity.dart';

part 'contract_state.freezed.dart';

@freezed
class ContractState with _$ContractState {
  const factory ContractState.initial() = _Initial;
  const factory ContractState.loading() = _Loading;
  const factory ContractState.loaded(ContractsEntity contracts) = _Loaded;
  const factory ContractState.error(String message) = _Error;
}
