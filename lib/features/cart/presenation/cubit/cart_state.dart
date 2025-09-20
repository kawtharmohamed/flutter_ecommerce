import '../../domain/entity/cart_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartEntity> items;
  final double total;

  CartLoaded(this.items, this.total);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
