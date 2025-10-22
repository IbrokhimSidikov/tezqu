import 'package:equatable/equatable.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';
import 'package:tezqu/features/products/data/models/product_model.dart';

abstract class WarehouseState extends Equatable {
  const WarehouseState();

  @override
  List<Object?> get props => [];
}

class WarehouseInitial extends WarehouseState {
  const WarehouseInitial();
}

class WarehouseLoading extends WarehouseState {
  final List<CategoryModel>? categories;
  
  const WarehouseLoading({this.categories});
  
  @override
  List<Object?> get props => [categories];
}

class CategoriesLoaded extends WarehouseState {
  final List<CategoryModel> categories;

  const CategoriesLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class WarehouseLoaded extends WarehouseState {
  final List<CategoryModel> categories;
  final List<ProductModel> products;

  const WarehouseLoaded({
    required this.categories,
    required this.products,
  });

  @override
  List<Object?> get props => [categories, products];
}

class WarehouseError extends WarehouseState {
  final String message;
  final List<CategoryModel>? categories;

  const WarehouseError(this.message, {this.categories});

  @override
  List<Object?> get props => [message, categories];
}
