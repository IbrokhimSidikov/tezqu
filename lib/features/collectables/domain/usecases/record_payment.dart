import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/collectable_repository.dart';

@lazySingleton
class RecordPayment with Usecase<Either<Failure, void>, RecordPaymentParams> {
  final CollectableRepository repository;

  RecordPayment(this.repository);

  @override
  Future<Either<Failure, void>> call(RecordPaymentParams params) async {
    return await repository.recordPayment(
      paymentId: params.paymentId,
      amount: params.amount,
      paymentMethodId: params.paymentMethodId,
      paymentDate: params.paymentDate,
    );
  }
}

class RecordPaymentParams extends Equatable {
  final String paymentId;
  final double amount;
  final String paymentMethodId;
  final String paymentDate;

  const RecordPaymentParams({
    required this.paymentId,
    required this.amount,
    required this.paymentMethodId,
    required this.paymentDate,
  });

  @override
  List<Object?> get props => [paymentId, amount, paymentMethodId, paymentDate];
}
