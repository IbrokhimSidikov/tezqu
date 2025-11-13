import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/contract_repository.dart';

@lazySingleton
class AcceptContract with Usecase<Either<Failure, void>, AcceptContractParams> {
  final ContractRepository repository;

  AcceptContract(this.repository);

  @override
  Future<Either<Failure, void>> call(AcceptContractParams params) async {
    return await repository.acceptContract(params.contractId);
  }
}

class AcceptContractParams extends Equatable {
  final String contractId;

  const AcceptContractParams({required this.contractId});

  @override
  List<Object?> get props => [contractId];
}
