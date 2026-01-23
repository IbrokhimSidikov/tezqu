import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> deleteAccount(String userId);
}
