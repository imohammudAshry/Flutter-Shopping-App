import '../models/product_model.dart';

class CartData {
  static final List<Product> _cartItems = [];

  static List<Product> get items => _cartItems;

  static void addToCart(Product product) {
    _cartItems.add(product);
  }

  static double get totalPrice =>
      _cartItems.fold(0.0, (sum, item) => sum + item.price);
}
