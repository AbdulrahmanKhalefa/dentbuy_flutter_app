class ProductModel {
  final String image;
  final String name;
  final String location;
  final String price;

  ProductModel({
    required this.image,
    required this.name,
    required this.location,
    required this.price,
  });
}

final List<ProductModel> clinicProducts = [
  ProductModel(
    image: 'assets/images/clinic.png',
    name: 'Downtown Smile Clinic',
    location: 'Mansoura, Egypt',
    price: '25,000 EGP',
  ),
  ProductModel(
    image: 'assets/images/clinic.png',
    name: 'Family Dental Hub',
    location: 'Cairo, Egypt',
    price: '28,500 EGP',
  ),
  ProductModel(
    image: 'assets/images/clinic.png',
    name: 'City Care Clinic',
    location: 'Alexandria, Egypt',
    price: '22,000 EGP',
  ),
  ProductModel(
    image: 'assets/images/clinic.png',
    name: 'Elite Smile Center',
    location: 'Giza, Egypt',
    price: '31,000 EGP',
  ),
];

final List<ProductModel> toolProducts = [
  ProductModel(
    image: 'assets/images/tools.png',
    name: 'Precision Handpiece',
    location: 'Tanta, Egypt',
    price: '950 EGP',
  ),
  ProductModel(
    image: 'assets/images/tools.png',
    name: 'Dental Mirror Set',
    location: 'Ismailia, Egypt',
    price: '720 EGP',
  ),
  ProductModel(
    image: 'assets/images/tools.png',
    name: 'Scaler Kit',
    location: 'Suez, Egypt',
    price: '1,150 EGP',
  ),
  ProductModel(
    image: 'assets/images/tools.png',
    name: 'Suction Device',
    location: 'Luxor, Egypt',
    price: '1,900 EGP',
  ),
];

