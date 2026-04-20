class Product {
  final int id;
  final String title;
  final double price;
  final String imagePath;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  // JSON formatındaki veriyi (Map) Dart nesnesine dönüştüren factory metodu
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(), // Tam sayı gelse bile ondalığa çevirir
      imagePath: json['image'],
    );
  }
}