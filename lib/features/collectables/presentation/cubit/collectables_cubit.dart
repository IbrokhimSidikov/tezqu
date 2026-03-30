import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../../expense/domain/repositories/expense_repository.dart';
import '../../domain/usecases/get_collectables.dart';
import '../../domain/usecases/get_user_balance.dart';
import '../../domain/usecases/record_payment.dart';
import 'collectables_state.dart';

@injectable
class CollectablesCubit extends Cubit<CollectablesState> {
  final GetCollectables getCollectables;
  final RecordPayment recordPaymentUseCase;
  final ExpenseRepository expenseRepository;
  final GetUserBalance getUserBalance;
  final AuthRepository authRepository;

  CollectablesCubit(
    this.getCollectables,
    this.recordPaymentUseCase,
    this.expenseRepository,
    this.getUserBalance,
    this.authRepository,
  ) : super(CollectablesInitial());

  Future<void> loadCollectables() async {
    emit(CollectablesLoading());

    try {
      final result = await getCollectables(NoParams());
      final paymentMethods = await expenseRepository.getPaymentMethods();
      
      final currentUser = await authRepository.getCurrentUser();
      double? pendingCollections;
      
      if (currentUser?.id != null) {
        final balanceResult = await getUserBalance(currentUser!.id!);
        balanceResult.fold(
          (failure) => null,
          (balance) => pendingCollections = balance.pendingCollections,
        );
      }

      result.fold(
        (failure) => emit(CollectablesError(failure.message)),
        (collectables) => emit(CollectablesLoaded(
          collectables,
          paymentMethods: paymentMethods,
          pendingCollections: pendingCollections,
        )),
      );
    } catch (e) {
      emit(CollectablesError(e.toString()));
    }
  }

  Future<void> refreshCollectables() async {
    await loadCollectables();
  }

  Future<bool> recordPayment({
    required String paymentId,
    required double amount,
    required String paymentMethodId,
    required String paymentDate,
  }) async {
    final result = await recordPaymentUseCase(
      RecordPaymentParams(
        paymentId: paymentId,
        amount: amount,
        paymentMethodId: paymentMethodId,
        paymentDate: paymentDate,
      ),
    );

    return result.fold(
      (failure) {
        emit(CollectablesError(failure.message));
        return false;
      },
      (_) {
        // Reload collectables after successful payment recording
        loadCollectables();
        return true;
      },
    );
  }
}
