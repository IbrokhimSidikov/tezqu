import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/contract_entity.dart';
import '../repositories/contract_repository.dart';

@lazySingleton
class GetContracts with Usecase<Either<Failure, ContractsEntity>, NoParams> {
  final ContractRepository repository;

  GetContracts(this.repository);

  @override
  Future<Either<Failure, ContractsEntity>> call(NoParams params) async {
    return await repository.getContracts();
  }
}
