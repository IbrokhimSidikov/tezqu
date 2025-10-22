import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_income_sources_usecase.dart';
import '../../domain/usecases/get_income_detail_usecase.dart';
import 'income_state.dart';

@injectable
class IncomeCubit extends Cubit<IncomeState> {
  final GetIncomeSourcesUseCase _getIncomeSourcesUseCase;
  final GetIncomeDetailUseCase _getIncomeDetailUseCase;

  IncomeCubit(
    this._getIncomeSourcesUseCase,
    this._getIncomeDetailUseCase,
  ) : super(const IncomeState.initial());

  Future<void> getIncomeSources({required int year, required int month}) async {
    emit(const IncomeState.loading());
    
    final result = await _getIncomeSourcesUseCase(
      IncomeSourcesParams(year: year, month: month),
    );
    
    result.fold(
      (failure) => emit(IncomeState.error(failure.message)),
      (incomeSources) => emit(IncomeState.loaded(incomeSources)),
    );
  }

  Future<void> getIncomeDetail({
    required String sourceType,
    required String userId,
    required int year,
    required int month,
  }) async {
    emit(const IncomeState.detailLoading());
    
    final result = await _getIncomeDetailUseCase(
      IncomeDetailParams(
        sourceType: sourceType,
        userId: userId,
        year: year,
        month: month,
      ),
    );
    
    result.fold(
      (failure) => emit(IncomeState.detailError(failure.message)),
      (incomeDetail) => emit(IncomeState.detailLoaded(incomeDetail)),
    );
  }
}
