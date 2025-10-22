import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/wishlist_service.dart';
import '../../../products/data/models/product_model.dart';
import 'wishlist_state.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  final WishlistService _wishlistService;

  WishlistCubit(this._wishlistService) : super(const WishlistInitial());

  Future<void> loadWishlist() async {
    emit(const WishlistLoading());
    
    try {
      final wishlistData = await _wishlistService.getWishlist();
      final products = wishlistData
          .map((json) => ProductModel.fromJson(json))
          .toList();
      
      emit(WishlistLoaded(products));
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }

  Future<void> removeFromWishlist(String productId) async {
    try {
      await _wishlistService.removeFromWishlist(productId);
      // Reload wishlist after removal
      await loadWishlist();
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
