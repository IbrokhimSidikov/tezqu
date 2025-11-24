import 'package:dartz/dartz.dart';
import 'package:tezqu/core/error/failures.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';
import 'package:tezqu/features/products/data/models/product_model.dart';

abstract class WarehouseRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory(String category);
  Future<Either<Failure, ProductModel>> createProduct({
    required String name,
    required String categoryId,
    required double price,
    String? description,
    String? currencyId,
    String? carBrandId,
    String? carModelId,
    Map<String, dynamic>? customFields,
    List<String>? imageIds,
  });
}
