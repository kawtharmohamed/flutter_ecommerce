import '../../domain/entity/product_entity.dart';
import '../model/product_model.dart';

extension ProductModelMapper on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: RatingEntity(
        rate: rating.rate,
        count: rating.count,
      ),
    );
  }
}
