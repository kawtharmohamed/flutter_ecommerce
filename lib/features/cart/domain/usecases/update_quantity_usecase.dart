import '../repository/cart_repository.dart';

class UpdateQuantityUseCase {
  final CartRepository repository;

  UpdateQuantityUseCase(this.repository);

  Future<void> call(int id, int quantity) async {
    return await repository.updateQuantity(id, quantity);
  }
}
