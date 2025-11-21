import 'package:flutter/material.dart';
import '../../utils/cart_data.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    final items = CartData.items;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: items.isEmpty
          ? const Center(
              child: Text("Your cart is empty", style: TextStyle(fontSize: 18)),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final p = items[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: Image.network(p.imageUrl,
                                width: 60, height: 60, fit: BoxFit.cover),
                            title: Text(p.title),
                            subtitle: Text("\$${p.price.toStringAsFixed(2)}"),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${CartData.totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Checkout completed!")));
                      setState(() {
                        CartData.items.clear();
                      });
                    },
                    icon: const Icon(Icons.payment),
                    label: const Text("Checkout"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(45)),
                  )
                ],
              ),
            ),
    );
  }
}
