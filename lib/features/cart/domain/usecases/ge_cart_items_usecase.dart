import '../entity/cart_entity.dart';
import '../repository/cart_repository.dart';

class GetCartItemsUseCase {
  final CartRepository repository;

  GetCartItemsUseCase(this.repository);

  Future<List<CartEntity>> call() async {
    return await repository.getCartItems();
  }
}
