import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/contract_entity.dart';
import '../../domain/repositories/contract_repository.dart';
import '../datasources/contract_remote_data_source.dart';

@LazySingleton(as: ContractRepository)
class ContractRepositoryImpl implements ContractRepository {
  final ContractRemoteDataSource remoteDataSource;

  ContractRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ContractsEntity>> getContracts() async {
    try {
      final result = await remoteDataSource.getContracts();
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'Server error occurred',
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> acceptContract(String contractId) async {
    try {
      await remoteDataSource.acceptContract(contractId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'Failed to accept contract',
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> rejectContract(String contractId) async {
    try {
      await remoteDataSource.rejectContract(contractId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'Failed to reject contract',
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
