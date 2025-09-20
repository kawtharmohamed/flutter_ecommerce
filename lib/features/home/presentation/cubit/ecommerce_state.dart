import 'package:e_commerce_app/features/home/domain/entity/product_entity.dart';

import '../../data/model/product_model.dart';

abstract class EcommerceState {}

class EcommerceInitial extends EcommerceState {}

class EcommerceLoading extends EcommerceState {}

class EcommerceLoaded extends EcommerceState {
  final List<String> categories;
  final List<ProductEntity> products;

  EcommerceLoaded({this.categories = const [], this.products = const []});
}

class EcommerceErrorState extends EcommerceState {
  final String message;
  EcommerceErrorState(this.message);
}
