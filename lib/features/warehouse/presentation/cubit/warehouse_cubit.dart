import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';
import 'package:tezqu/features/products/data/models/product_model.dart';
import 'package:tezqu/features/warehouse/domain/repositories/warehouse_repository.dart';
import 'package:tezqu/features/warehouse/presentation/cubit/warehouse_state.dart';
import '../../../../core/services/category_cache_service.dart';

@injectable
class WarehouseCubit extends Cubit<WarehouseState> {
  final WarehouseRepository _repository;
  final CategoryCacheService _categoryCacheService;
  List<CategoryModel> _categories = [];
  String? _currentCategoryId;
  List<ProductModel> _allProducts = []; // Cache all products for search

  WarehouseCubit(
    this._repository,
    this._categoryCacheService,
  ) : super(const WarehouseInitial());

  Future<void> initialize() async {
    emit(const WarehouseLoading());
    
    // Try to get cached categories first
    final cachedCategories = _categoryCacheService.getCachedCategories();
    
    if (cachedCategories != null && cachedCategories.isNotEmpty) {
      // Use cached categories
      _categories = cachedCategories;
      
      // Load all products for the first category
      _currentCategoryId = cachedCategories[0].id;
      await loadProductsByCategory(cachedCategories[0].id);
      return;
    }
    
    // No cache available, fetch from API
    final categoriesResult = await _repository.getCategories();
    
    await categoriesResult.fold(
      (failure) async {
        emit(WarehouseError(failure.message));
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
          emit(WarehouseLoaded(categories: categories, products: []));
        }
      },
    );
  }

  Future<void> loadAllProducts() async {
    if (_categories.isEmpty) {
      await initialize();
      return;
    }
    
    emit(WarehouseLoading(categories: _categories));
    
    final result = await _repository.getAllProducts();
    
    result.fold(
      (failure) => emit(WarehouseError(failure.message, categories: _categories)),
      (products) {
        _allProducts = products;
        print('📦 loadAllProducts: Cached ${products.length} products');
        if (products.isNotEmpty) {
          print('📦 Sample names: ${products.take(3).map((p) => p.name).join(", ")}');
        }
        emit(WarehouseLoaded(categories: _categories, products: products));
      },
    );
  }

  Future<void> loadProductsByCategory(String category) async {
    if (_categories.isEmpty) {
      await initialize();
      return;
    }
    
    // Don't reload if already showing this category
    if (_currentCategoryId == category && state is WarehouseLoaded) {
      return;
    }
    
    _currentCategoryId = category;
    emit(WarehouseLoading(categories: _categories));
    
    final result = await _repository.getProductsByCategory(category);
    
    result.fold(
      (failure) => emit(WarehouseError(failure.message, categories: _categories)),
      (products) {
        _allProducts = products;
        print('📦 loadProductsByCategory: Cached ${products.length} products for category $category');
        if (products.isNotEmpty) {
          print('📦 Sample names: ${products.take(3).map((p) => p.name).join(", ")}');
        }
        emit(WarehouseLoaded(categories: _categories, products: products));
      },
    );
  }

  /// Force refresh categories from API (clears cache)
  Future<void> refreshCategories() async {
    _categoryCacheService.clearCache();
    await initialize();
  }

  /// Search products by query
  void searchProducts(String query) {
    if (state is! WarehouseLoaded) {
      print('🔍 Search aborted: State is not WarehouseLoaded');
      return;
    }
    
    final trimmedQuery = query.trim();
    print('🔍 Searching for: "$trimmedQuery"');
    print('🔍 Total products in cache: ${_allProducts.length}');
    
    if (trimmedQuery.isEmpty) {
      // If search is cleared, reload current category
      if (_currentCategoryId != null) {
        loadProductsByCategory(_currentCategoryId!);
      } else {
        emit(WarehouseLoaded(
          categories: _categories,
          products: _allProducts,
        ));
      }
      return;
    }
    
    // Filter products based on search query
    final searchLower = trimmedQuery.toLowerCase();
    final filteredProducts = _allProducts.where((product) {
      // Search in product name
      if (product.name.isNotEmpty && product.name.toLowerCase().contains(searchLower)) {
        print('✅ Found match in name: ${product.name}');
        return true;
      }
      
      // Search in description/details
      if (product.details.isNotEmpty && product.details.toLowerCase().contains(searchLower)) {
        print('✅ Found match in details: ${product.name}');
        return true;
      }
      
      // Search in year
      if (product.year.isNotEmpty && product.year.toLowerCase().contains(searchLower)) {
        print('✅ Found match in year: ${product.name}');
        return true;
      }
      
      // Search in price
      if (product.price.isNotEmpty && product.price.toLowerCase().contains(searchLower)) {
        print('✅ Found match in price: ${product.name}');
        return true;
      }
      
      // Search in custom fields
      if (product.customFields != null) {
        final fields = product.customFields!;
        for (var value in fields.values) {
          if (value != null && value.toString().toLowerCase().contains(searchLower)) {
            print('✅ Found match in custom field: ${product.name}');
            return true;
          }
        }
      }
      
      return false;
    }).toList();
    
    print('🔍 Found ${filteredProducts.length} matching products');
    
    emit(WarehouseLoaded(
      categories: _categories,
      products: filteredProducts,
      searchQuery: trimmedQuery,
    ));
  }

  /// Clear search and return to category view
  void clearSearch() {
    if (_currentCategoryId != null) {
      loadProductsByCategory(_currentCategoryId!);
    }
  }
}
