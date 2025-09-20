import '../repository/cart_repository.dart';

class RemoveItemUseCase {
  final CartRepository repository;

  RemoveItemUseCase(this.repository);

  Future<void> call(int id) async {
    return await repository.removeItem(id);
  }
}
