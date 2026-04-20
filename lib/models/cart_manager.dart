import 'product.dart';

class CartManager {
  // Bellekte tek bir liste tutuyoruz
  static final List<Product> cartItems = [];
  
  static void add(Product product) {
    cartItems.add(product);
  }
  static void remove(int index) {
  cartItems.removeAt(index);
}
}