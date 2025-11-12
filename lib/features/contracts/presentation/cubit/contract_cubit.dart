import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/use_case.dart';
import '../../domain/usecases/get_contracts.dart';
import 'contract_state.dart';

@injectable
class ContractCubit extends Cubit<ContractState> {
  final GetContracts getContracts;

  ContractCubit(this.getContracts) : super(const ContractState.initial());

  Future<void> loadContracts() async {
    emit(const ContractState.loading());
    
    final result = await getContracts(NoParams());
    
    result.fold(
      (failure) => emit(ContractState.error(failure.message)),
      (contracts) => emit(ContractState.loaded(contracts)),
    );
  }
}
