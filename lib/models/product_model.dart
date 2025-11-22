class Product {
  final String id;
  final String title;
  final String imageUrl;
  final String description;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

final sampleProducts = [
  Product(
    id: 'p1',
    title: 'Blue Shirt',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
    description: 'Comfortable cotton shirt',
  ),
  Product(
    id: 'p2',
    title: 'Sneakers',
    imageUrl: 'https://picsum.photos/seed/p2/400/400',
    description: 'Running shoes',
  ),
];
