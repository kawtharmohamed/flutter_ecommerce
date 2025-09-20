import 'package:json_annotation/json_annotation.dart';
part 'cart_model.g.dart';

@JsonSerializable()
class CartModel{
  final int? id;
  final int productId;
  final String name;
  final String image;
  final double price;
  final int quantity;
  final String category;

  CartModel({
    this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.category
  }) ;

  factory CartModel.fromJson(Map<String, dynamic> map) => _$CartModelFromJson(map);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
