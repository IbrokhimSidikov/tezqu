import 'package:injectable/injectable.dart';
import 'package:tezqu/features/products/data/models/category_model.dart';

@lazySingleton
class CategoryCacheService {
  List<CategoryModel>? _cachedCategories;
  DateTime? _lastFetchTime;
  
  // Cache duration - 5 minutes
  static const Duration cacheDuration = Duration(minutes: 5);

  /// Get cached categories if available and not expired
  List<CategoryModel>? getCachedCategories() {
    if (_cachedCategories == null || _lastFetchTime == null) {
      return null;
    }

    final now = DateTime.now();
    final difference = now.difference(_lastFetchTime!);

    // Return cached data if it's still valid
    if (difference < cacheDuration) {
      return _cachedCategories;
    }

    // Cache expired, clear it
    clearCache();
    return null;
  }

  /// Cache categories
  void cacheCategories(List<CategoryModel> categories) {
    _cachedCategories = categories;
    _lastFetchTime = DateTime.now();
  }

  /// Clear the cache
  void clearCache() {
    _cachedCategories = null;
    _lastFetchTime = null;
  }

  /// Check if cache is valid
  bool get isCacheValid {
    if (_cachedCategories == null || _lastFetchTime == null) {
      return false;
    }

    final now = DateTime.now();
    final difference = now.difference(_lastFetchTime!);
    return difference < cacheDuration;
  }
}
