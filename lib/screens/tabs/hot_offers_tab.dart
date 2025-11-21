import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../utils/cart_data.dart';

class HotOffersTab extends StatefulWidget {
  const HotOffersTab({super.key});

  @override
  State<HotOffersTab> createState() => _HotOffersTabState();
}

class _HotOffersTabState extends State<HotOffersTab> {
  String selectedCategory = "All";

  final categories = ["All", "Fruits", "Vegetables", "Fast-food"];

  @override
  Widget build(BuildContext context) {
    // 🧮 تصفية المنتجات حسب الفئة
    final filteredProducts = selectedCategory == "All"
        ? sampleProducts
        : sampleProducts
            .where((p) => p.category == selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Hot Offers"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 الفئات (categories)
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isSelected = cat == selectedCategory;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = cat;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.black : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // 🔹 المنتجات في شكل شبكة (GridView)
            Expanded(
              child: GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  // تخفيض عشوائي للتجربة
                  final discountPercent = [10, 20, 30, 40, 50][index % 5];
                  final discountedPrice =
                      product.price - (product.price * discountPercent / 100);

                  return Stack(
                    children: [
                      // 🔸 البطاقة الأساسية
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16)),
                                child: Image.network(product.imageUrl,
                                    fit: BoxFit.cover, width: double.infinity),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$${discountedPrice.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$${product.price.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        decoration:
                                            TextDecoration.lineThrough,
                                        color: Colors.grey,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_shopping_cart),
                              onPressed: () {
                                CartData.addToCart(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        '${product.title} added to cart (${discountPercent}% off!)'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: -25,
                        child: Transform.rotate(
                          angle: -0.7,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            color: Colors.redAccent,
                            child: Text(
                              '$discountPercent% OFF',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
