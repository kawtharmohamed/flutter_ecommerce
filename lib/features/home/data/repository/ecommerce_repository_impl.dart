import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/core/networking/network_exceptions.dart';
import 'package:e_commerce_app/features/home/data/mapper/product_model_mapper.dart';
import '../../domain/entity/product_entity.dart';
import '../../domain/repository/ecommerce_repository.dart';
import '../../../../core/networking/api_services.dart';

class EcommerceRepositoryImpl implements EcommerceRepository {
  final ApiServices apiServices;

  EcommerceRepositoryImpl(this.apiServices);

  @override
  Future<ApiResult<List<String>>> getCategories() async {
    try {
      final response = await apiServices.getCategories();
      return Success(response);
    } catch (error) {
      return Failure(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<List<ProductEntity>>> getProducts() async {
    try {
      final response = await apiServices.getProducts();
      final entities = response.map((e) => e.toEntity()).toList();
      return Success(entities);
    } catch (error) {
      return Failure(NetworkExceptions.getDioException(error));
    }
  }
}
