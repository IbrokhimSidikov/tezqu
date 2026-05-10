import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../domain/entities/balance_entity.dart';
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

  @override
  Future<Either<Failure, void>> recordPayment({
    required String paymentId,
    required double amount,
    required String paymentMethodId,
    required String paymentDate,
  }) async {
    debugPrint('[CollectableRepo] recordPayment called | paymentId=$paymentId');
    try {
      await remoteDataSource.recordPayment(
        paymentId: paymentId,
        amount: amount,
        paymentMethodId: paymentMethodId,
        paymentDate: paymentDate,
      );
      debugPrint('[CollectableRepo] recordPayment ✓');
      return const Right(null);
    } on DioException catch (e) {
      final msg = e.response?.data['message'] ?? 'Failed to record payment';
      debugPrint('[CollectableRepo] recordPayment DioException: $msg | status=${e.response?.statusCode} | data=${e.response?.data}');
      return Left(ServerFailure(msg));
    } catch (e) {
      debugPrint('[CollectableRepo] recordPayment unexpected error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> delayPayment({
    required String paymentId,
    required String delayUntil,
    required String delayReason,
  }) async {
    debugPrint('[CollectableRepo] delayPayment called | paymentId=$paymentId delayUntil=$delayUntil');
    try {
      await remoteDataSource.delayPayment(
        paymentId: paymentId,
        delayUntil: delayUntil,
        delayReason: delayReason,
      );
      debugPrint('[CollectableRepo] delayPayment ✓');
      return const Right(null);
    } on DioException catch (e) {
      final msg = e.response?.data['message'] ?? 'Failed to delay payment';
      debugPrint('[CollectableRepo] delayPayment DioException: $msg | status=${e.response?.statusCode} | data=${e.response?.data}');
      return Left(ServerFailure(msg));
    } catch (e) {
      debugPrint('[CollectableRepo] delayPayment unexpected error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserBalanceEntity>> getUserBalanceDetails(String userId) async {
    try {
      final result = await remoteDataSource.getUserBalanceDetails(userId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'Failed to fetch balance details',
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
