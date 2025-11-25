import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';
import 'package:tezqu/features/products/data/models/product_model.dart';
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
  List<ProductModel> _allProducts = []; // Cache all products for search

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
      
      // Load all products grouped by category
      await loadAllProductsGrouped();
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
        
        // Load all products grouped by category
        await loadAllProductsGrouped();
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

  Future<void> loadAllProductsGrouped() async {
    if (_categories.isEmpty) {
      await initialize();
      return;
    }
    
    emit(ProductLoading(categories: _categories));
    
    // Load all products
    final result = await _repository.getProducts();
    
    result.fold(
      (failure) => emit(ProductError(failure.message, categories: _categories)),
      (products) {
        // Cache all products for search
        _allProducts = products;
        
        // Group products by category
        final Map<String, List<ProductModel>> grouped = {};
        
        // Initialize empty lists for all categories
        for (var category in _categories) {
          grouped[category.id] = [];
        }
        
        // Group products by their category
        for (var product in products) {
          if (grouped.containsKey(product.category)) {
            grouped[product.category]!.add(product);
          } else {
            // If category not in our list, create a new entry
            grouped[product.category] = [product];
          }
        }
        
        emit(ProductLoaded(
          categories: _categories,
          products: products,
          groupedProducts: grouped,
        ));
      },
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

  /// Search products by query
  void searchProducts(String query) {
    if (state is! ProductLoaded) return;
    
    final trimmedQuery = query.trim();
    
    if (trimmedQuery.isEmpty) {
      // If search is cleared, reload all products grouped
      loadAllProductsGrouped();
      return;
    }
    
    // Filter products based on search query
    final searchLower = trimmedQuery.toLowerCase();
    final filteredProducts = _allProducts.where((product) {
      // Search in product name
      if (product.name.isNotEmpty && product.name.toLowerCase().contains(searchLower)) {
        return true;
      }
      
      // Search in description/details
      if (product.details.isNotEmpty && product.details.toLowerCase().contains(searchLower)) {
        return true;
      }
      
      // Search in year
      if (product.year.isNotEmpty && product.year.toLowerCase().contains(searchLower)) {
        return true;
      }
      
      // Search in price
      if (product.price.isNotEmpty && product.price.toLowerCase().contains(searchLower)) {
        return true;
      }
      
      // Search in custom fields
      if (product.customFields != null) {
        final fields = product.customFields!;
        for (var value in fields.values) {
          if (value != null && value.toString().toLowerCase().contains(searchLower)) {
            return true;
          }
        }
      }
      
      return false;
    }).toList();
    
    // Don't group products when searching - show flat list
    emit(ProductLoaded(
      categories: _categories,
      products: filteredProducts,
      searchQuery: trimmedQuery,
    ));
  }

  /// Clear search and return to grouped view
  void clearSearch() {
    loadAllProductsGrouped();
  }
}
