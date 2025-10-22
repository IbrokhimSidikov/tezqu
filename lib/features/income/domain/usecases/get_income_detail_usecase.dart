import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/income_detail_entity.dart';
import '../repositories/income_repository.dart';

@lazySingleton
class GetIncomeDetailUseCase {
  final IncomeRepository _repository;

  GetIncomeDetailUseCase(this._repository);

  Future<Either<Failure, IncomeDetailEntity>> call(IncomeDetailParams params) async {
    return await _repository.getIncomeDetail(
      sourceType: params.sourceType,
      userId: params.userId,
      year: params.year,
      month: params.month,
    );
  }
}

class IncomeDetailParams extends Equatable {
  final String sourceType;
  final String userId;
  final int year;
  final int month;

  const IncomeDetailParams({
    required this.sourceType,
    required this.userId,
    required this.year,
    required this.month,
  });

  @override
  List<Object?> get props => [sourceType, userId, year, month];
}
