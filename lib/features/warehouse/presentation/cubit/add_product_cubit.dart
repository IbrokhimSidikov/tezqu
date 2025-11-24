import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tezqu/features/warehouse/domain/repositories/warehouse_repository.dart';
import 'add_product_state.dart';

@injectable
class AddProductCubit extends Cubit<AddProductState> {
  final WarehouseRepository _repository;

  AddProductCubit(this._repository) : super(AddProductInitial());

  Future<void> createProduct({
    required String name,
    required String categoryId,
    required double price,
    String? description,
    String? currencyId,
    String? carBrandId,
    String? carModelId,
    Map<String, dynamic>? customFields,
    List<String>? imageIds,
  }) async {
    emit(AddProductLoading());

    final result = await _repository.createProduct(
      name: name,
      categoryId: categoryId,
      price: price,
      description: description,
      currencyId: currencyId,
      carBrandId: carBrandId,
      carModelId: carModelId,
      customFields: customFields,
      imageIds: imageIds,
    );

    result.fold(
      (failure) => emit(AddProductError(failure.message)),
      (product) => emit(const AddProductSuccess('Maxsulot muvaffaqiyatli qo\'shildi')),
    );
  }

  void reset() {
    emit(AddProductInitial());
  }
}
