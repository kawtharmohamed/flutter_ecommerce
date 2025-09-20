import '../entity/cart_entity.dart';
import '../repository/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<void> call(CartEntity item) async {
    return await repository.addToCart(item);
  }
}
