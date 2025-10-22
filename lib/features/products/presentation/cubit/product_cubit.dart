import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';
import 'package:tezqu/features/products/domain/repositories/product_repository.dart';
import 'package:tezqu/features/products/presentation/cubit/product_state.dart';
import '../../../../core/services/wishlist_service.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _repository;
  final WishlistService _wishlistService;
  List<CategoryModel> _categories = [];
  String? _currentCategoryId;

  ProductCubit(this._repository, this._wishlistService) : super(const ProductInitial());

  Future<void> initialize() async {
    emit(const ProductLoading());
    
    // First, fetch categories
    final categoriesResult = await _repository.getCategories();
    
    await categoriesResult.fold(
      (failure) async {
        emit(ProductError(failure.message));
      },
      (categories) async {
        _categories = categories;
        
        // If we have categories, load products for the first category
        if (categories.isNotEmpty) {
          _currentCategoryId = categories[0].id;
          await loadProductsByCategory(categories[0].id);
        } else {
          emit(ProductLoaded(categories: categories, products: []));
        }
      },
    );
  }

  Future<void> loadProducts() async {
    if (_categories.isEmpty) {
      await initialize();
      return;
    }
    
    emit(ProductLoading(categories: _categories));
    
    final result = await _repository.getProducts();
    
    result.fold(
      (failure) => emit(ProductError(failure.message, categories: _categories)),
      (products) => emit(ProductLoaded(categories: _categories, products: products)),
    );
  }

  Future<void> loadProductsByCategory(String category) async {
    if (_categories.isEmpty) {
      await initialize();
      return;
    }
    
    // Don't reload if already showing this category
    if (_currentCategoryId == category && state is ProductLoaded) {
      return;
    }
    
    _currentCategoryId = category;
    emit(ProductLoading(categories: _categories));
    
    final result = await _repository.getProductsByCategory(category);
    
    result.fold(
      (failure) => emit(ProductError(failure.message, categories: _categories)),
      (products) => emit(ProductLoaded(categories: _categories, products: products)),
    );
  }

  Future<void> addToWishlist(String productId) async {
    try {
      await _wishlistService.addToWishlist(productId);
    } catch (e) {
      // Silently fail or handle error as needed
    }
  }
}
