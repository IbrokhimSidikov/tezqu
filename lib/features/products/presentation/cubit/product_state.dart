import 'package:equatable/equatable.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';
import 'package:tezqu/features/products/data/models/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  final List<CategoryModel>? categories;
  
  const ProductLoading({this.categories});
  
  @override
  List<Object?> get props => [categories];
}

class CategoriesLoaded extends ProductState {
  final List<CategoryModel> categories;

  const CategoriesLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class ProductLoaded extends ProductState {
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final Map<String, List<ProductModel>>? groupedProducts;
  final String? searchQuery;

  const ProductLoaded({
    required this.categories,
    required this.products,
    this.groupedProducts,
    this.searchQuery,
  });

  @override
  List<Object?> get props => [categories, products, groupedProducts, searchQuery];
}

class ProductError extends ProductState {
  final String message;
  final List<CategoryModel>? categories;

  const ProductError(this.message, {this.categories});

  @override
  List<Object?> get props => [message, categories];
}
