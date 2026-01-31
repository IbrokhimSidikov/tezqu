import 'package:dartz/dartz.dart';
import 'package:tezqu/core/error/failures.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';
import 'package:tezqu/features/products/data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory(String category);
  Future<Either<Failure, ProductModel>> getProductById(String productId);
}
