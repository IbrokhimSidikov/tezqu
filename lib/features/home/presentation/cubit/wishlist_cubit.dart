import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/wishlist_service.dart';
import '../../../products/data/models/product_model.dart';
import 'wishlist_state.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  final WishlistService _wishlistService;
  List<ProductModel> _allProducts = [];

  WishlistCubit(this._wishlistService) : super(const WishlistInitial());

  Future<void> loadWishlist() async {
    emit(const WishlistLoading());
    
    try {
      final wishlistData = await _wishlistService.getWishlist();
      final products = wishlistData
          .map((json) => ProductModel.fromJson(json))
          .toList();
      
      _allProducts = products;
      emit(WishlistLoaded(products));
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(WishlistLoaded(_allProducts));
      return;
    }

    final filteredProducts = _allProducts.where((product) {
      final nameLower = product.name.toLowerCase();
      final queryLower = query.toLowerCase();
      final detailsLower = product.details.toLowerCase();
      final yearMatch = product.year.toLowerCase();
      
      return nameLower.contains(queryLower) ||
             detailsLower.contains(queryLower) ||
             yearMatch.contains(queryLower);
    }).toList();

    emit(WishlistLoaded(filteredProducts, searchQuery: query));
  }

  void clearSearch() {
    emit(WishlistLoaded(_allProducts));
  }

  Future<void> removeFromWishlist(String productId) async {
    try {
      await _wishlistService.removeFromWishlist(productId);
      _allProducts.removeWhere((product) => product.id == productId);
      
      final currentState = state;
      if (currentState is WishlistLoaded && currentState.searchQuery != null) {
        searchProducts(currentState.searchQuery!);
      } else {
        emit(WishlistLoaded(_allProducts));
      }
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }

  Future<void> addToWishlist(String productId) async {
    try {
      await _wishlistService.addToWishlist(productId);
      // Reload wishlist after addition
      await loadWishlist();
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }
}
