part of 'cart_bloc.dart';

@immutable
sealed class CartState extends Equatable {
  const CartState();
}

final class CartLoading extends CartState {
  @override
  List<Object> get props => [];
  Widget loadingShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade300,
      child: const Text('Loading'),
    );
  }
}

final class CartLoaded extends CartState {
  const CartLoaded({this.cart = const Cart()});

  final Cart cart;

  @override
  List<Object> get props => [cart];
}

final class CartError extends CartState {
  @override
  List<Object> get props => [];
}
