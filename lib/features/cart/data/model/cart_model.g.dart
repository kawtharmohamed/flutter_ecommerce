// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
  id: (json['id'] as num?)?.toInt(),
  productId: (json['productId'] as num).toInt(),
  name: json['name'] as String,
  image: json['image'] as String,
  price: (json['price'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  category: json['category'] as String,
);

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'name': instance.name,
  'image': instance.image,
  'price': instance.price,
  'quantity': instance.quantity,
  'category': instance.category,
};
