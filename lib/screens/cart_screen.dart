import 'package:flutter/material.dart';
import '../models/cart_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet'),
      ),
      body: CartManager.cartItems.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Sepetiniz boş!', style: TextStyle(fontSize: 18)),
                ],
              ),
            )
          : ListView.builder(
              itemCount: CartManager.cartItems.length,
              itemBuilder: (context, index) {
                final item = CartManager.cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      item.imagePath,
                      width: 50,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.devices),
                    ),
                    title: Text(item.title),
                    subtitle: Text('\$${item.price}'),
                    // Çöp kutusu simgesi buraya ekleniyor
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () {
                        // Durumu (State) güncellemek için setState kullanıyoruz
                        setState(() {
                          CartManager.remove(index);
                        });
                        
                        // Kullanıcıya bilgi vermek için küçük bir bildirim
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Ürün sepetten silindi!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}