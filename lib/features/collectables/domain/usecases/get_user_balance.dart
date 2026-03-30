import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/balance_entity.dart';
import '../repositories/collectable_repository.dart';

@lazySingleton
class GetUserBalance with Usecase<Either<Failure, UserBalanceEntity>, String> {
  final CollectableRepository repository;

  GetUserBalance(this.repository);

  @override
  Future<Either<Failure, UserBalanceEntity>> call(String userId) async {
    return await repository.getUserBalanceDetails(userId);
  }
}
