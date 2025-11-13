import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/contract_repository.dart';

@lazySingleton
class RejectContract with Usecase<Either<Failure, void>, RejectContractParams> {
  final ContractRepository repository;

  RejectContract(this.repository);

  @override
  Future<Either<Failure, void>> call(RejectContractParams params) async {
    return await repository.rejectContract(params.contractId);
  }
}

class RejectContractParams extends Equatable {
  final String contractId;

  const RejectContractParams({required this.contractId});

  @override
  List<Object?> get props => [contractId];
}
