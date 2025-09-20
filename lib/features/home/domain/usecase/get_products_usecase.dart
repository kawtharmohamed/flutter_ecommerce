import 'package:e_commerce_app/core/networking/api_result.dart';
import '../entity/product_entity.dart';
import '../repository/ecommerce_repository.dart';

class GetProductsUseCase {
  final EcommerceRepository repository;

  GetProductsUseCase(this.repository);

  Future<ApiResult<List<ProductEntity>>> call() {
    return repository.getProducts();
  }
}
