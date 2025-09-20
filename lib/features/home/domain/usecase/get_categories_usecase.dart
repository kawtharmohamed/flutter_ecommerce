import 'package:e_commerce_app/core/networking/api_result.dart';
import '../repository/ecommerce_repository.dart';

class GetCategoriesUseCase {
  final EcommerceRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<ApiResult<List<String>>> call() {
    return repository.getCategories();
  }
}
