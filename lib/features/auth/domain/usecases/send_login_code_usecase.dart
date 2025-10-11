import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

@injectable
class SendLoginCodeUseCase {
  final AuthRepository repository;

  SendLoginCodeUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String phone,
  }) async {
    return await repository.sendLoginCode(phone: phone);
  }
}
