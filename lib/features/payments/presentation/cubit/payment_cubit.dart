import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecase/use_case.dart';
import '../../domain/usecases/get_payments_usecase.dart';
import 'payment_state.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  final GetPaymentsUseCase _getPaymentsUseCase;

  PaymentCubit(this._getPaymentsUseCase) : super(const PaymentState.initial());

  Future<void> getPayments() async {
    emit(const PaymentState.loading());
    
    final result = await _getPaymentsUseCase(NoParams());
    
    result.fold(
      (failure) => emit(PaymentState.error(failure.message)),
      (payments) => emit(PaymentState.loaded(payments)),
    );
  }
}
