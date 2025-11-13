import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/use_case.dart';
import '../../domain/usecases/accept_contract.dart';
import '../../domain/usecases/get_contracts.dart';
import '../../domain/usecases/reject_contract.dart';
import 'contract_state.dart';

@injectable
class ContractCubit extends Cubit<ContractState> {
  final GetContracts getContracts;
  final AcceptContract acceptContract;
  final RejectContract rejectContract;

  ContractCubit(
    this.getContracts,
    this.acceptContract,
    this.rejectContract,
  ) : super(const ContractState.initial());

  Future<void> loadContracts() async {
    emit(const ContractState.loading());
    
    final result = await getContracts(NoParams());
    
    result.fold(
      (failure) => emit(ContractState.error(failure.message)),
      (contracts) => emit(ContractState.loaded(contracts)),
    );
  }

  Future<bool> acceptContractAction(String contractId) async {
    final result = await acceptContract(AcceptContractParams(contractId: contractId));
    
    return result.fold(
      (failure) {
        emit(ContractState.error(failure.message));
        return false;
      },
      (_) {
        // Reload contracts after accepting
        loadContracts();
        return true;
      },
    );
  }

  Future<bool> rejectContractAction(String contractId) async {
    final result = await rejectContract(RejectContractParams(contractId: contractId));
    
    return result.fold(
      (failure) {
        emit(ContractState.error(failure.message));
        return false;
      },
      (_) {
        // Reload contracts after rejecting
        loadContracts();
        return true;
      },
    );
  }
}
