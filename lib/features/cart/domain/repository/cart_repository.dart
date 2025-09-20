import '../entity/cart_entity.dart';

abstract class CartRepository {
  Future<void> addToCart(CartEntity item);
  Future<List<CartEntity>> getCartItems();
  Future<void> updateQuantity(int id, int quantity);
  Future<void> removeItem(int id);
}
