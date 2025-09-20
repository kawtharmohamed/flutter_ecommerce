import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/ge_cart_items_usecase.dart';
import '../../domain/usecases/remove_item_usecase.dart';
import '../../domain/usecases/update_quantity_usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartItemsUseCase getCartItemsUseCase;
  final UpdateQuantityUseCase updateQuantityUseCase;
  final RemoveItemUseCase removeItemUseCase;

  CartCubit( this .addToCartUseCase, this.getCartItemsUseCase,
      this.updateQuantityUseCase, this.removeItemUseCase) : super(CartInitial());

  Future<void> loadCart() async {
    emit(CartLoading());
    try {
      final items = await getCartItemsUseCase();
      final total = items.fold<double>(
        0.0, (sum, item) => sum + (item.price * item.quantity),
      );
      emit(CartLoaded(items, total));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> addToCart(CartEntity item) async {
    try {
      await addToCartUseCase(item);
      await loadCart();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> updateQuantity(int id, int quantity) async {
    try {
      await updateQuantityUseCase(id, quantity);
      await loadCart();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> removeItem(int id) async {
    try {
      await removeItemUseCase(id);
      await loadCart();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  bool isInCart(int productId) {
    return state is CartLoaded &&
        (state as CartLoaded).items.any((item) => item.productId == productId);
  }

}
