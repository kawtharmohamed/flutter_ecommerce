import 'package:bloc/bloc.dart';
import '../../../../core/networking/network_exceptions.dart';
import '../../domain/entity/product_entity.dart';
import '../../domain/usecase/get_categories_usecase.dart';
import '../../domain/usecase/get_products_usecase.dart';
import 'ecommerce_state.dart';

class EcommerceCubit extends Cubit<EcommerceState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsUseCase getProductsUseCase;

  EcommerceCubit(this.getCategoriesUseCase, this.getProductsUseCase)
    : super(EcommerceInitial());

  Future<void> fetchCategories() async {
    emit(EcommerceLoading());
    final result = await getCategoriesUseCase();
    result.when(
      success: (data) {
        final currentProducts = state is EcommerceLoaded ? (state as EcommerceLoaded).products : <ProductEntity>[];
        emit(EcommerceLoaded(categories: data, products: currentProducts));
      },
      failure: (error) {
        final message = NetworkExceptions.getErrorMessage(error);
        emit(EcommerceErrorState(message));
      },

    );
  }

  Future<void> fetchProducts() async {
    emit(EcommerceLoading());
    final result = await getProductsUseCase();
    result.when(
      success: (data) {
        final currentCategories = state is EcommerceLoaded ? (state as EcommerceLoaded).categories : <String>[];
        emit(EcommerceLoaded(categories: currentCategories, products: data));
      },
      failure: (error) {
        final message = NetworkExceptions.getErrorMessage(error);
        emit(EcommerceErrorState(message));
      },
    );
  }
}
