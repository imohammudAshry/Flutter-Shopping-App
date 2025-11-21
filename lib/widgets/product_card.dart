import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../utils/cart_data.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const ProductCard({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Expanded(
              child: Image.network(product.imageUrl, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          Text("\$${product.price.toStringAsFixed(2)}/kg",
              style: const TextStyle(color: Colors.orange)),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              CartData.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.title} added to cart')));
              onAdd();
            },
          ),
        ],
      ),
    );
  }
}
