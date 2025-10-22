import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/income_entity.dart';
import '../entities/income_detail_entity.dart';

abstract class IncomeRepository {
  Future<Either<Failure, IncomeSourcesEntity>> getIncomeSources({
    required int year,
    required int month,
  });

  Future<Either<Failure, IncomeDetailEntity>> getIncomeDetail({
    required String sourceType,
    required String userId,
    required int year,
    required int month,
  });
}
