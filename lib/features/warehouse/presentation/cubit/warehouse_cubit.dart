import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';
import 'package:tezqu/features/warehouse/domain/repositories/warehouse_repository.dart';
import 'package:tezqu/features/warehouse/presentation/cubit/warehouse_state.dart';
import '../../../../core/services/category_cache_service.dart';

@injectable
class WarehouseCubit extends Cubit<WarehouseState> {
  final WarehouseRepository _repository;
  final CategoryCacheService _categoryCacheService;
  List<CategoryModel> _categories = [];
  String? _currentCategoryId;

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
      (products) => emit(WarehouseLoaded(categories: _categories, products: products)),
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
      (products) => emit(WarehouseLoaded(categories: _categories, products: products)),
    );
  }

  /// Force refresh categories from API (clears cache)
  Future<void> refreshCategories() async {
    _categoryCacheService.clearCache();
    await initialize();
  }
}
