// lib/widgets/offer_card.dart
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  const OfferCard({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}
