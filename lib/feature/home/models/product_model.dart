class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String sellerId;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.sellerId,
  });
}

const List<Product> dummyProducts = [
  Product(
    id: 'product_1',
    title: 'Premium Dental Chair',
    description: 'Modern dental chair with luxury finish and multiple adjustments. Perfect for new clinics.',
    price: 12999.00,
    imageUrl: 'assets/images/clinic.png',
    sellerId: 'seller_001',
  ),
  Product(
    id: 'product_2',
    title: 'Electric Dental Drill Kit',
    description: 'Complete electric dental drill with accessories for fast and precise treatment.',
    price: 3499.00,
    imageUrl: 'assets/images/tools.png',
    sellerId: 'seller_002',
  ),
  Product(
    id: 'product_3',
    title: 'Clinic Reception Desk',
    description: 'Stylish reception desk built for medical waiting areas with storage and cable management.',
    price: 7600.00,
    imageUrl: 'assets/images/clinic.png',
    sellerId: 'seller_003',
  ),
  Product(
    id: 'product_4',
    title: 'Professional Tool Set',
    description: 'High-quality hand tools set for dental and medical maintenance work.',
    price: 1999.00,
    imageUrl: 'assets/images/tools.png',
    sellerId: 'seller_004',
  ),
];
