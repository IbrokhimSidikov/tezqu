import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/contract_entity.dart';

abstract class ContractRepository {
  Future<Either<Failure, ContractsEntity>> getContracts();
  Future<Either<Failure, void>> acceptContract(String contractId);
  Future<Either<Failure, void>> rejectContract(String contractId);
}
