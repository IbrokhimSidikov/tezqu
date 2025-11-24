import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tezqu/core/error/exceptions.dart';
import 'package:tezqu/core/error/failures.dart';
import 'package:tezqu/core/network/dio_client.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';
import 'package:tezqu/features/products/data/models/product_model.dart';
import 'package:tezqu/features/warehouse/domain/repositories/warehouse_repository.dart';

@LazySingleton(as: WarehouseRepository)
class WarehouseRepositoryImpl implements WarehouseRepository {
  final DioClient dioClient;

  WarehouseRepositoryImpl(this.dioClient);

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
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      final response = await dioClient.get('/products', queryParameters: {
        'showAll': 1,
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
      return Left(ServerFailure('Failed to load products: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory(String category) async {
    try {
      final response = await dioClient.get('/products', queryParameters: {
        'category': category,
        'showAll': 1,
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

  @override
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
  }) async {
    try {
      final Map<String, dynamic> data = {
        'name': name,
        'category_id': categoryId,
        'price': price,
      };

      if (description != null && description.isNotEmpty) {
        data['description'] = description;
      }
      if (currencyId != null && currencyId.isNotEmpty) {
        data['currency_id'] = currencyId;
      }
      if (carBrandId != null && carBrandId.isNotEmpty) {
        data['car_brand_id'] = carBrandId;
      }
      if (carModelId != null && carModelId.isNotEmpty) {
        data['car_model_id'] = carModelId;
      }
      if (customFields != null && customFields.isNotEmpty) {
        data['custom_fields'] = customFields;
      }
      if (imageIds != null && imageIds.isNotEmpty) {
        data['image_ids'] = imageIds;
      }

      final response = await dioClient.post('/products', data: data);
      final product = ProductModel.fromJson(response.data);
      return Right(product);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Failed to create product: ${e.toString()}'));
    }
  }
}
