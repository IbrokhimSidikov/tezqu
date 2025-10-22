import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/income_entity.dart';

abstract class IncomeRepository {
  Future<Either<Failure, IncomeSourcesEntity>> getIncomeSources({
    required int year,
    required int month,
  });
}
