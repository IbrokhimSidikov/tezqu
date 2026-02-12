import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      (contracts) async {
        emit(ContractState.loaded(contracts));
        await _updateNewContractsCount(contracts);
      },
    );
  }

  Future<void> _updateNewContractsCount(contracts) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final seenIds = prefs.getStringList('seen_contract_ids') ?? [];
      final seenSet = seenIds.toSet();
      
      // Get all contract IDs from loaded contracts
      final allContractIds = <String>[];
      for (final group in contracts.contractGroups) {
        for (final contract in group.contracts) {
          allContractIds.add(contract.id);
        }
      }
      
      // Calculate new contracts count (contracts not in seen set)
      final newContractsCount = allContractIds.where((id) => !seenSet.contains(id)).length;
      
      // Save the count
      await prefs.setInt('new_contracts_count', newContractsCount);
      
      print('📊 New contracts count updated: $newContractsCount');
    } catch (e) {
      print('Error updating new contracts count: $e');
    }
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
