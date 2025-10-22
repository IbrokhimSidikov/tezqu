import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/income_repository.dart';

@lazySingleton
class AddToWishlistUseCase {
  final IncomeRepository _repository;

  AddToWishlistUseCase(this._repository);

  Future<Either<Failure, void>> call(AddToWishlistParams params) async {
    return await _repository.addToWishlist(
      productId: params.productId,
    );
  }
}

class AddToWishlistParams extends Equatable {
  final String productId;

  const AddToWishlistParams({
    required this.productId,
  });

  @override
  List<Object?> get props => [productId];
}
