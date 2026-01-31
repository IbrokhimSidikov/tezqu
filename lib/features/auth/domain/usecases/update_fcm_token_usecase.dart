import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

@injectable
class UpdateFcmTokenUseCase {
  final AuthRepository repository;

  UpdateFcmTokenUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String fcmToken,
  }) async {
    return await repository.updateFcmToken(
      fcmToken: fcmToken,
    );
  }
}
