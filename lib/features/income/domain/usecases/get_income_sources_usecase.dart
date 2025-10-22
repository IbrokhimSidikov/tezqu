import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/income_entity.dart';
import '../repositories/income_repository.dart';

@lazySingleton
class GetIncomeSourcesUseCase {
  final IncomeRepository _repository;

  GetIncomeSourcesUseCase(this._repository);

  Future<Either<Failure, IncomeSourcesEntity>> call(IncomeSourcesParams params) async {
    return await _repository.getIncomeSources(
      year: params.year,
      month: params.month,
    );
  }
}

class IncomeSourcesParams extends Equatable {
  final int year;
  final int month;

  const IncomeSourcesParams({
    required this.year,
    required this.month,
  });

  @override
  List<Object?> get props => [year, month];
}
