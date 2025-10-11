import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

@injectable
class SendCodeUseCase {
  final AuthRepository repository;

  SendCodeUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String phone,
  }) async {
    return await repository.sendCode(phone: phone);
  }
}
