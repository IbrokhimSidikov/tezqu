import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/income_entity.dart';
import '../../domain/entities/income_detail_entity.dart';
import '../../domain/repositories/income_repository.dart';
import '../datasources/income_remote_data_source.dart';

@LazySingleton(as: IncomeRepository)
class IncomeRepositoryImpl implements IncomeRepository {
  final IncomeRemoteDataSource _remoteDataSource;

  IncomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, IncomeSourcesEntity>> getIncomeSources({
    required int year,
    required int month,
  }) async {
    try {
      final incomeSourcesModel = await _remoteDataSource.getIncomeSources(
        year: year,
        month: month,
      );
      return Right(incomeSourcesModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, IncomeDetailEntity>> getIncomeDetail({
    required String sourceType,
    required String userId,
    required int year,
    required int month,
  }) async {
    try {
      final incomeDetailModel = await _remoteDataSource.getIncomeDetail(
        sourceType: sourceType,
        userId: userId,
        year: year,
        month: month,
      );
      return Right(incomeDetailModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
