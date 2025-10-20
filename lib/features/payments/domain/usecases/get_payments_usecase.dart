import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/payment_entity.dart';
import '../repositories/payment_repository.dart';

@lazySingleton
class GetPaymentsUseCase with Usecase<Either<Failure, PaymentsEntity>, NoParams> {
  final PaymentRepository _repository;

  GetPaymentsUseCase(this._repository);

  @override
  Future<Either<Failure, PaymentsEntity>> call(NoParams params) async {
    return await _repository.getPayments();
  }
}
