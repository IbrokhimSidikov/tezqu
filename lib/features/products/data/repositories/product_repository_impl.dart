import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tezqu/core/error/exceptions.dart';
import 'package:tezqu/core/error/failures.dart';
import 'package:tezqu/core/network/dio_client.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';
import 'package:tezqu/features/products/data/models/product_model.dart';
import 'package:tezqu/features/products/domain/repositories/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final DioClient dioClient;

  ProductRepositoryImpl(this.dioClient);

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final response = await dioClient.get('/product-categories');
      final List<CategoryModel> categories = (response.data as List)
          .map((item) => CategoryModel.fromJson(item))
          .toList();
      return Right(categories);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Failed to load categories'));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response = await dioClient.get('/products');
      // API returns {data: [...], meta: {...}}
      final data = response.data['data'] as List;
      final List<ProductModel> products = data
          .map((item) => ProductModel.fromJson(item))
          .toList();
      return Right(products);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Failed to load products: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory(String category) async {
    try {
      final response = await dioClient.get('/products', queryParameters: {
        'category': category,
      });
      // API returns {data: [...], meta: {...}}
      final data = response.data['data'] as List;
      final List<ProductModel> products = data
          .map((item) => ProductModel.fromJson(item))
          .toList();
      return Right(products);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Failed to load products by category: ${e.toString()}'));
    }
  }
}
