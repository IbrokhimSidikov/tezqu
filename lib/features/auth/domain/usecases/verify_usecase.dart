import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class VerifyUseCase {
  final AuthRepository repository;

  VerifyUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String phone,
    required String code,
  }) async {
    return await repository.verify(
      phone: phone,
      code: code,
    );
  }
}
