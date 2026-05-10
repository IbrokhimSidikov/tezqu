import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/collectable_repository.dart';

@lazySingleton
class DelayPayment with Usecase<Either<Failure, void>, DelayPaymentParams> {
  final CollectableRepository repository;

  DelayPayment(this.repository);

  @override
  Future<Either<Failure, void>> call(DelayPaymentParams params) async {
    return await repository.delayPayment(
      paymentId: params.paymentId,
      delayUntil: params.delayUntil,
      delayReason: params.delayReason,
    );
  }
}

class DelayPaymentParams extends Equatable {
  final String paymentId;
  final String delayUntil;
  final String delayReason;

  const DelayPaymentParams({
    required this.paymentId,
    required this.delayUntil,
    required this.delayReason,
  });

  @override
  List<Object?> get props => [paymentId, delayUntil, delayReason];
}

