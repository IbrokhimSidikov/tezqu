import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';
import 'package:tezqu/features/products/domain/repositories/product_repository.dart';
import 'package:tezqu/features/products/presentation/cubit/product_state.dart';
import '../../../../core/services/wishlist_service.dart';
import '../../../../core/services/category_cache_service.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _repository;
  final WishlistService _wishlistService;
  final CategoryCacheService _categoryCacheService;
  List<CategoryModel> _categories = [];
  String? _currentCategoryId;

  ProductCubit(
    this._repository, 
    this._wishlistService,
    this._categoryCacheService,
  ) : super(const ProductInitial());

  Future<void> initialize() async {
    emit(const ProductLoading());
    
    // Try to get cached categories first
    final cachedCategories = _categoryCacheService.getCachedCategories();
    
    if (cachedCategories != null && cachedCategories.isNotEmpty) {
      // Use cached categories
      _categories = cachedCategories;
      
      // Load products for the first category
      _currentCategoryId = cachedCategories[0].id;
      await loadProductsByCategory(cachedCategories[0].id);
      return;
    }
    
    // No cache available, fetch from API
    final categoriesResult = await _repository.getCategories();
    
    await categoriesResult.fold(
      (failure) async {
        emit(ProductError(failure.message));
      },
      (categories) async {
        _categories = categories;
        
        // Cache the fetched categories
        _categoryCacheService.cacheCategories(categories);
        
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

  /// Force refresh categories from API (clears cache)
  Future<void> refreshCategories() async {
    _categoryCacheService.clearCache();
    await initialize();
  }
}
