import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import '../widgets/offer_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _addToCart(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Item added to the cart: $title')),
    );
  }

  // NEW: Offers Data
  final List<Map<String, String>> offers = [
    {
      "title": "50% Off Electronics",
      "subtitle": "Limited time offer on all tech gadgets",
    },
    {
      "title": "50% OFF",
      "subtitle": "Free Shipping Weekend\nNo delivery charges on orders above \$50",
    },
    {
      "title": "Buy 2 Get 1 Free",
      "subtitle": "On selected accessories and peripherals",
    },
    {
      "title": "Student Discount",
      "subtitle": "Extra 20% off with valid student ID",
    },
    {
      "title": "Bundle Deals",
      "subtitle": "Save more when you buy complete setups",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final featured = sampleProducts.take(3).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Our Products')),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: featured.length,
                controller: PageController(viewportFraction: 0.9),
                itemBuilder: (context, index) {
                  final p = featured[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(p.imageUrl, fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = 2;
                  final itemWidth = (constraints.maxWidth - 16) / crossAxisCount;
                  final itemHeight = 220.0;

                  return GridView.builder(
                    itemCount: sampleProducts.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: itemWidth / itemHeight,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (context, i) {
                      final p = sampleProducts[i];
                      return ProductCard(
                        product: p,
                        onAdd: () => _addToCart(p.title),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hot Offers',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OfferCard(
                    imageUrl: 'https://picsum.photos/seed/offer$index/200/200',
                    title: offer["title"]!,
                    subtitle: offer["subtitle"]!,
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
