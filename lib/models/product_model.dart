class Product {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String category;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.price,
  });
}

final sampleProducts = [
  Product(
    id: 'p1',
    title: 'Apple',
    imageUrl: 'https://pin.it/2IFd3lnYi',
    description: 'Fresh red apple',
    category: 'Fruits',
    price: 10.45,
  ),
  Product(
    id: 'p2',
    title: 'Orange',
    imageUrl: 'https://pin.it/TJ7Nr8yKn',
    description: 'Juicy oranges',
    category: 'Fruits',
    price: 14.75,
  ),
  Product(
    id: 'p3',
    title: 'Capsicum',
    imageUrl: 'https://pin.it/7BLJrjieH',
    description: 'Fresh green capsicum',
    category: 'Vegetables',
    price: 75.68,
  ),
  Product(
    id: 'p4',
    title: 'Dragon Fruit',
    imageUrl: 'https://pin.it/3ASgWJbgj',
    description: 'Exotic dragon fruit',
    category: 'Fruits',
    price: 45.35,
  ),
];
