class CartEntity {
  final int? id;
  final int productId;
  final String name;
  final String image;
  final double price;
  final int quantity;
  final String category;

  const CartEntity({
    this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.category,
  });
}
