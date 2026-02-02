import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/collectable_entity.dart';
import '../repositories/collectable_repository.dart';

@lazySingleton
class GetCollectables with Usecase<Either<Failure, CollectablesEntity>, NoParams> {
  final CollectableRepository repository;

  GetCollectables(this.repository);

  @override
  Future<Either<Failure, CollectablesEntity>> call(NoParams params) async {
    return await repository.getCollectables();
  }
}
