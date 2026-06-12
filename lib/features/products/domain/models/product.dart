class Product {
  final int id;
  final String name;
  final String? image;
  final String? description;
  final double price;
  final int quantity;
  final String? createdAt;
  final String? updatedAt;

  const Product({
    required this.id,
    required this.name,
    this.image,
    this.description,
    required this.price,
    required this.quantity,
    this.createdAt,
    this.updatedAt,
  });
}
