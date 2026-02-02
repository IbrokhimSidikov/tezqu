import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/collectable_entity.dart';

abstract class CollectableRepository {
  Future<Either<Failure, CollectablesEntity>> getCollectables();
  Future<Either<Failure, CollectableContractEntity>> getContractDetails(String contractId);
}
