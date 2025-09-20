import 'package:e_commerce_app/core/networking/api_result.dart';

import '../entity/product_entity.dart';

abstract class EcommerceRepository {
  Future<ApiResult<List<String>>> getCategories();
  Future<ApiResult<List<ProductEntity>>> getProducts();
}
