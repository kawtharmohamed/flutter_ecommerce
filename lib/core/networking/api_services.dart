import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/home/data/model/product_model.dart';
import 'api_constants.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  @GET(ApiConstants.categories)
  Future<List<String>> getCategories();
  @GET(ApiConstants.products)
  Future <List<ProductModel>> getProducts();

}