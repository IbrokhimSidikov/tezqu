import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../domain/entities/collectable_entity.dart';
import '../../domain/repositories/collectable_repository.dart';
import '../datasources/collectable_remote_data_source.dart';

@LazySingleton(as: CollectableRepository)
class CollectableRepositoryImpl implements CollectableRepository {
  final CollectableRemoteDataSource remoteDataSource;
  final AuthRepository authRepository;

  CollectableRepositoryImpl(this.remoteDataSource, this.authRepository);

  @override
  Future<Either<Failure, CollectablesEntity>> getCollectables() async {
    try {
      final currentUser = await authRepository.getCurrentUser();
      if (currentUser == null || currentUser.id == null) {
        return Left(ServerFailure('User not authenticated'));
      }

      final currentUserId = currentUser.id!;
      final result = await remoteDataSource.getCollectables();
      
      final collectablesWithDetails = <CollectableContractEntity>[];
      
      for (final contract in result.contracts) {
        try {
          final detailsModel = await remoteDataSource.getContractDetails(contract.id);
          final contractEntity = detailsModel.toEntity();
          
          if (contractEntity.collectorId == currentUserId) {
            collectablesWithDetails.add(contractEntity);
          }
        } catch (e) {
          continue;
        }
      }
      
      return Right(CollectablesEntity(contracts: collectablesWithDetails));
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'Server error occurred',
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CollectableContractEntity>> getContractDetails(String contractId) async {
    try {
      final result = await remoteDataSource.getContractDetails(contractId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'Failed to fetch contract details',
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
