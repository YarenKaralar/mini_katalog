import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'product_detail_screen.dart'; // Yeni detay sayfasını ekledik
import '../models/product.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({super.key});

  // 4 elemanlı güncel simülasyon verisi
  final List<Map<String, dynamic>> mockJsonData = [
    {"id": 1, "title": "AirPods Pro", "price": 249.0, "image": "assets/airpodsPro.jpg.webp"},
    {"id": 2, "title": "MacBook Pro 14\"", "price": 1599.0, "image": "assets/macbookPro.jpg"},
    {"id": 3, "title": "HomePod", "price": 99.0, "image": "assets/homepod.jpeg"},
    {"id": 4, "title": "iPad Air", "price": 599.0, "image": "assets/ipadAir.jpeg"}
  ];

  @override
  Widget build(BuildContext context) {
    List<Product> products = mockJsonData.map((json) => Product.fromJson(json)).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Discover', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text('Search products', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'GIFT STORE',
              style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // GridView Entegrasyonu
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Yan yana 2 sütun
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8, 
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  
                  return GestureDetector( 
                    onTap: () {
                      // Detay Sayfasına Geçiş ve Veri Taşıma
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(product: product),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 1,
                      color: Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  product.imagePath,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.devices, size: 40, color: Colors.blue),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              product.title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '\$${product.price}',
                              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
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