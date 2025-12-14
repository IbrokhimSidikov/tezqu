import 'package:equatable/equatable.dart';
import '../../../products/data/models/product_model.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WishlistInitial extends WishlistState {
  const WishlistInitial();
}

class WishlistLoading extends WishlistState {
  const WishlistLoading();
}

class WishlistLoaded extends WishlistState {
  final List<ProductModel> products;
  final String? searchQuery;

  const WishlistLoaded(this.products, {this.searchQuery});

  @override
  List<Object?> get props => [products, searchQuery];
}

class WishlistError extends WishlistState {
  final String message;

  const WishlistError(this.message);

  @override
  List<Object?> get props => [message];
}
